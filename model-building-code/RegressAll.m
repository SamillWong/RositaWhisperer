%% Code to fit and compare the different model configurations
%
% This script requires a dataset of the following form:
%
% Three lots of input pairs to the three instructions in the sequence:
% input = {[Nx2 double],[Nx2 double],[Nx2 double]}
%
% Numeric codes representing the three instructions in an Nx3 matrix. Codes
% are assumed to be assigned to the chosen representative instructions
% (of which there were 5, in our original implementation) beginning from 1.
% opcodes = [Nx3 double]
%
% Vector of trace measurements (indices chosen to correspond to the most
% relevant point for each instruction):
% traces = [Nx1 double]
%
% From these variables we can compute all the candidate terms included in
% the model equations. The challenge is keeping track of all of them,
% especially when we come to construct the design matrix for the linear
% regression.
%
% This command loads our dataset:ldr
%t = load('exampleData.mat');
clear;
% the order the states are arranged here do not match with the 
% commonly used order of them (eors, ldr, str, muls)
% only hard requirement here is to have no-state be at the last, where
% all bits would be 0
t0 = load('m-str.mat');
ss0 = load('state-str.mat');

t1 = load('m-ldr.mat');
ss1 = load('state-ldr.mat');

t2 = load('m-eors.mat');
ss2 = load('state-eors.mat');

t3 = load('m-movs.mat');
ss3 = load('state-movs.mat');

t4 = load('m-no.mat');
ss4 = load('state-no.mat');

t.opcodes= vertcat(t0.opcodes, t1.opcodes, t2.opcodes, t3.opcodes, t4.opcodes);
t.input{1}= vertcat(t0.input{1}, t1.input{1}, t2.input{1}, t3.input{1}, t4.input{1});
t.input{2}= vertcat(t0.input{2}, t1.input{2}, t2.input{2}, t3.input{2}, t4.input{2});
t.input{3}= vertcat(t0.input{3}, t1.input{3}, t2.input{3}, t3.input{3}, t4.input{3});
t.trace = vertcat(t0.trace, t1.trace, t2.trace, t3.trace, t4.trace);

t.oplist = t0.oplist;
ss.state_input= vertcat(ss0.state_input, ss1.state_input, ss2.state_input, ss3.state_input, ss4.state_input);
ss.state_type = vertcat(repmat(1,size(ss0.state_input,1),1),...
     repmat(2,size(ss1.state_input,1),1),...
     repmat(3,size(ss2.state_input,1),1),...
     repmat(4,size(ss3.state_input,1),1),...
     repmat(5,size(ss4.state_input,1),1));

% Number of instructions:
nI = numel(unique(t.opcodes(:)));
nIS = 5; % state insts

Xcols = cell(0,3);
% A cell array of variable groups in shorthand and in full, along with
% their column indices in the design matrix:
Xcols = describeX(Xcols,'Const','Intercept',1,1);
% The previous and subsequent instruction variables will be in the form of
% M-1 dummies with the instruction coded 1 excluded as the baseline. Edit
% the instruction codes as applicable according to the selection and the
% chosen ordering.
Xcols = describeX(Xcols,'I1','Previous instruction (LSL/STR/LDR/MUL)',[1:nI-1],NaN);
Xcols = describeX(Xcols,'I3','Subsequent instruction (LSL/STR/LDR/MUL)',[1:nI-1],NaN);
% The operands will be fitted bit by bit to allow maximum flexibility in
% the (first order) relationship between the leakage and the data inputs.
% I.e. there will be 32 variables for each operand.
Xcols = describeX(Xcols,'o1','1st operand',[1:32],NaN);
Xcols = describeX(Xcols,'o2','2nd operand',[1:32],NaN);
% These sets of variables (also one per bit of the operand) represent the
% bit-wise state transition from the previous operand (i.e. 1 indicates a
% bit flip, 0 indicates no change).
Xcols = describeX(Xcols,'t1','1st transition',[1:32],NaN);
Xcols = describeX(Xcols,'t2','2nd transition',[1:32],NaN);
% Note that, to avoid overwhelming data complexity, the interactions
% between the data and previous and subsequent instructions will involve
% the Hamming weights and distances of the operands, not their individual
% bits and bit flips.
Xcols = describeX(Xcols,'o1*I1','Interaction: 1st operand (HW) & previous instruction',[1:nI-1],NaN);
Xcols = describeX(Xcols,'o2*I1','Interaction: 2nd operand (HW) & previous instruction',[1:nI-1],NaN);
Xcols = describeX(Xcols,'t1*I1','Interaction: 1st transition (HD) & previous instruction',[1:nI-1],NaN);
Xcols = describeX(Xcols,'t2*I1','Interaction: 2nd transition (HD) & previous instruction',[1:nI-1],NaN);
Xcols = describeX(Xcols,'o1*I3','Interaction: 1st operand (HW) & subsequent instruction',[1:nI-1],NaN);
Xcols = describeX(Xcols,'o2*I3','Interaction: 2nd operand (HW) & subsequent instruction',[1:nI-1],NaN);
Xcols = describeX(Xcols,'t1*I3','Interaction: 1st transition (HD) & subsequent instruction',[1:nI-1],NaN);
Xcols = describeX(Xcols,'t2*I3','Interaction: 2nd transition (HD) & subsequent instruction',[1:nI-1],NaN);
% These remaining four categories are for the second order interactions of
% the operands and the corresponding transitions.
Xcols = describeX(Xcols,'o1int','1st operand 2nd order',[1:nchoosek(32,2)],NaN);
Xcols = describeX(Xcols,'o2int','2nd operand 2nd order',[1:nchoosek(32,2)],NaN);
Xcols = describeX(Xcols,'t1int','1st transition 2nd order',[1:nchoosek(32,2)],NaN);
Xcols = describeX(Xcols,'t2int','2nd transition 2nd order',[1:nchoosek(32,2)],NaN);
% It is convenient to define a few alternative combinations and subsets of
% the above, beginning with ALL (first order) data variables:
Xcols = describeX(Xcols,'D','Data',[1:32],...
    [Xcols{strcmpi(Xcols(:,1),'o1'),3}(1),Xcols{strcmpi(Xcols(:,1),'o2'),3}(1),...
    Xcols{strcmpi(Xcols(:,1),'t1'),3}(1),Xcols{strcmpi(Xcols(:,1),'t2'),3}(1)]);
% All data interactions:
Xcols = describeX(Xcols,'D*I1','Interaction: Data & previous instruction',[1:nI-1],...
    [Xcols{strcmpi(Xcols(:,1),'o1*I1'),3}(1),Xcols{strcmpi(Xcols(:,1),'o2*I1'),3}(1),...
    Xcols{strcmpi(Xcols(:,1),'t1*I1'),3}(1),Xcols{strcmpi(Xcols(:,1),'t2*I1'),3}(1)]);
Xcols = describeX(Xcols,'D*I3','Interaction: Data & subsequent instruction',[1:nI-1],...
    [Xcols{strcmpi(Xcols(:,1),'o1*I3'),3}(1),Xcols{strcmpi(Xcols(:,1),'o2*I3'),3}(1),...
    Xcols{strcmpi(Xcols(:,1),'t1*I3'),3}(1),Xcols{strcmpi(Xcols(:,1),'t2*I3'),3}(1)]);
Xcols = describeX(Xcols,'Dint','All 2nd order data terms',[1:nchoosek(32,2)],...
    [Xcols{strcmpi(Xcols(:,1),'o1int'),3}(1),Xcols{strcmpi(Xcols(:,1),'o2int'),3}(1),...
    Xcols{strcmpi(Xcols(:,1),'t1int'),3}(1),Xcols{strcmpi(Xcols(:,1),'t2int'),3}(1)]);
% Generate all possible index pairs (in the order that the interaction
% terms will appear in the design matrix):
pairs = nchoosek([1:32],2);
adjpairs = find(abs(pairs(:,1)-pairs(:,2))==1)';
% Just the adjacent bit interactions:
Xcols = describeX(Xcols,'Dadj','Adjacent 2nd order operand/transition effects',adjpairs,...
    [Xcols{strcmpi(Xcols(:,1),'o1int'),3}(1),Xcols{strcmpi(Xcols(:,1),'o2int'),3}(1),...
    Xcols{strcmpi(Xcols(:,1),'t1int'),3}(1),Xcols{strcmpi(Xcols(:,1),'t2int'),3}(1)]);
% Narrower groups of the adjacent bit interactions:
Xcols = describeX(Xcols,'o1adj','Adjacent 2nd order 1st operand effects',adjpairs,...
    Xcols{strcmpi(Xcols(:,1),'o1int'),3}(1));
Xcols = describeX(Xcols,'o2adj','Adjacent 2nd order 2nd operand effects',adjpairs,...
    Xcols{strcmpi(Xcols(:,1),'o2int'),3}(1));
Xcols = describeX(Xcols,'t1adj','Adjacent 2nd order 1st transition effects',adjpairs,...
    Xcols{strcmpi(Xcols(:,1),'t1int'),3}(1));
Xcols = describeX(Xcols,'t2adj','Adjacent 2nd order 2nd transition effects',adjpairs,...
    Xcols{strcmpi(Xcols(:,1),'t2int'),3}(1));
Xcols = describeX(Xcols,'s','HD state',[1:128],NaN);
Xcols = describeX(Xcols,'ow','HD overwrite',[1],NaN);
Xcols = describeX(Xcols,'o1*o2','Cross interaction prev. inst. operand 1 & curr. inst. operand 2',[1],NaN);
Xcols = describeX(Xcols,'o2*o1','Cross interaction prev. inst. operand 2 & curr. inst. operand 1',[1],NaN);


% Cell array specifying the models in terms of indices in X with a string
% to express the model equation for the purposes of reporting:
modelList = cell(0,2);
% Previous/subsequent instructions and first order data terms:
modelList = addModel(modelList,Xcols,{'Const','I1','I3','D'},[],'I1+I3+D');
modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','ow'},[],'I1+I3+D+ow');
% Including data interactions with previous instruction:
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1'},[],'I1+I3+D+D*I1');
% % Including data interactions with subsequent instruction:
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I3'},[],'I1+I3+D+D*I3');
% % Including data interactions with previous and subsequent instructions:
modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3'},[],'I1+I3+D+D*I1+D*I3'); %*

modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','o1*o2','o2*o1'},[],'I1+I3+D+D*I1+D*I3+o1*o2+o2*o1'); %*
modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','ow'},[],'I1+I3+D+D*I1+D*I3+ow'); %*
modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','s'},[],'I1+I3+D+D*I1+D*I3+s');
modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','s','ow'},[],'I1+I3+D+D*I1+D*I3+s+ow');
modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','s','o1*o2','o2*o1'},[],'I1+I3+D+D*I1+D*I3+s+o1*o2+o2*o1');
modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','s','ow','o1*o2','o2*o1'},[],'I1+I3+D+D*I1+D*I3+s+ow+o1*o2+o2*o1');

% % Just the previous instruction:
% modelList = addModel(modelList,Xcols,{'Const','I1'},[],'I1');
% % Just the subsequent instruction:
% modelList = addModel(modelList,Xcols,{'Const','I3'},[],'I3');
% % Just the instructions:
% modelList = addModel(modelList,Xcols,{'Const','I1','I3'},[],'I1+I3');
% modelList = addModel(modelList,Xcols,{'Const','I1','lsls'},[],'I1+lsls');
% %Just the data:
% modelList = addModel(modelList,Xcols,{'Const','D'},[],'D');
% modelList = addModel(modelList,Xcols,{'Const','D','ow'},[],'D+ow');
% %Just the previous instruction and data:
% modelList = addModel(modelList,Xcols,{'Const','I1','D','D*I1'},[],'D+I1+I1*D');
% %Just the subsequent instruction and data:
% modelList = addModel(modelList,Xcols,{'Const','I3','D','D*I3'},[],'D+I3+I3*D');
% %Excluding each operand and change in operand in turn:
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','o2','t1','t2'},[],'I1+I3+D\o1');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','o1','t1','t2'},[],'I1+I3+D\o2');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','o1','o2','t2'},[],'I1+I3+D\t1');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','o1','o2','t1'},[],'I1+I3+D\t2');
% %Excluding selected data interactions in turn:
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3'},{'o1*I1','o1*I3'},...
%     'I1+I3+D+(D\o1)*I1+(D\o1)*I3');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3'},{'o2*I1','o2*I3'},...
%     'I1+I3+D+(D\o2)*I1+(D\o2)*I3');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3'},{'t1*I1','t1*I3'},...
%     'I1+I3+D+(D\t1)*I1+(D\t1)*I3');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3'},{'t2*I1','t2*I3'},...
%     'I1+I3+D+(D\t2)*I1+(D\t2)*I3');
% % Excluding selected data and data interactions in turn:
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3'},{'o1','o1*I1','o1*I3'},...
%     'I1+I3+(D\o1)+(D\o1)*I1+(D\o1)*I3');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3'},{'o2','o2*I1','o2*I3'},...
%     'I1+I3+(D\o2)+(D\o2)*I1+(D\o2)*I3');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3'},{'t1','t1*I1','t1*I3'},...
%     'I1+I3+(D\t1)+(D\t1)*I1+(D\t1)*I3');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3'},{'t2','t2*I1','t2*I3'},...
%     'I1+I3+(D\t2)+(D\t2)*I1+(D\t2)*I3');
% %Adding in second order data terms:
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','Dint'},[],'I1+I3+D+D*I1+D*I3+Dint');
% % Adding in just adjacent second order data terms:
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','Dadj'},[],'I1+I3+D+D*I1+D*I3+Dadj');
% % Adding in different combinations of second order data terms:
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','o1adj','o2adj'},[],...
%     'I1+I3+D+D*I1+D*I3+o1adj+o2adj');
% modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','o1int','o2int'},[],...
%  'I1+I3+D+D*I1+D*I3+o1int+o2int');  %*

modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','o1int','o2int','s','ow'},[],...
 'I1+I3+D+D*I1+D*I3+o1int+o2int+s+ow'); 
modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','o1int','o2int','s','ow','o1*o2','o2*o1'},[],...
 'I1+I3+D+D*I1+D*I3+o1int+o2int+s+ow+o1*o2+o2*o1'); 


modelList = addModel(modelList,Xcols,{'Const','I1','I3','D','D*I1','D*I3','t1adj','t2adj'},[],...
     'I1+I3+D+D*I1+D*I3+t1adj+t2adj');
 % A null model with no explanatory variables:
modelList = addModel(modelList,Xcols,{'Const'},[],'Null');

% Cell array of nested models to compare using the F-test in order to
% decide which terms to keep and which to discard:
testPairs = cell(0,4);
% testPairs = compareModel(testPairs,modelList,'I1+I3+D','I1+I3+D+D*I1+D*I3','Interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D','I1+I3+D+D*I1','I1 interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D','I1+I3+D+D*I3','I3 interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D','I1+I3+D+ow','OW');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I3','I1+I3+D+D*I1+D*I3','I1 interactions(*)');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1','I1+I3+D+D*I1+D*I3','I3 interactions(*)');
testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3','I1+I3+D+D*I1+D*I3+s','S(*)');
testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3','I1+I3+D+D*I1+D*I3+ow','OW(*)');
testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3','I1+I3+D+D*I1+D*I3+o1*o2+o2*o1','X');
% %testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3+IS+s','I1+I3+D+D*I1+D*I3+IS+s+ow','OW(*)');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3','I1+I3+D+D*I1+D*I3+s+ow','OW(*)');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3','I1+I3+D+D*I1+D*I3+o1int+o2int','OW(*)');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+(D\o1)*I1+(D\o1)*I3','I1+I3+D+D*I1+D*I3','o1 interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+(D\o2)*I1+(D\o2)*I3','I1+I3+D+D*I1+D*I3','o2 interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+(D\t1)*I1+(D\t1)*I3','I1+I3+D+D*I1+D*I3','t1 interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+(D\t2)*I1+(D\t2)*I3','I1+I3+D+D*I1+D*I3','t2 interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+(D\o1)+(D\o1)*I1+(D\o1)*I3','I1+I3+D+D*I1+D*I3','o1 level, interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+(D\o2)+(D\o2)*I1+(D\o2)*I3','I1+I3+D+D*I1+D*I3','o2 level, interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+(D\t1)+(D\t1)*I1+(D\t1)*I3','I1+I3+D+D*I1+D*I3','t1 level, interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+(D\t2)+(D\t2)*I1+(D\t2)*I3','I1+I3+D+D*I1+D*I3','t2 level, interactions');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D\o1','I1+I3+D','o1 level');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D\o2','I1+I3+D','o2 level');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D\t1','I1+I3+D','t1 level');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D\t2','I1+I3+D','t2 level');
% testPairs = compareModel(testPairs,modelList,'Null','I1','I1');
% testPairs = compareModel(testPairs,modelList,'Null','I3','I3');
% testPairs = compareModel(testPairs,modelList,'Null','I1+I3','I1+I3');
% testPairs = compareModel(testPairs,modelList,'Null','D','Data');
% testPairs = compareModel(testPairs,modelList,'D','D+ow','Data+ow');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3','I1+I3+D+D*I1+D*I3+o1adj+o2adj','Adjacent bits');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3+o1adj+o2adj','I1+I3+D+D*I1+D*I3+Dadj','Adjacent bit flips');
% testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3+o1adj+o2adj','I1+I3+D+D*I1+D*I3+o1int+o2int','Non-adjacent bits'); 
testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3+s+ow','I1+I3+D+D*I1+D*I3+o1int+o2int+s+ow','Non-adjacent bits'); 
testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3+s','I1+I3+D+D*I1+D*I3+s+o1*o2+o2*o1','S+X'); 
testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3+s+ow','I1+I3+D+D*I1+D*I3+s+ow+o1*o2+o2*o1','S+OW+X'); 
testPairs = compareModel(testPairs,modelList,'I1+I3+D+D*I1+D*I3+o1int+o2int+s+ow','I1+I3+D+D*I1+D*I3+o1int+o2int+s+ow+o1*o2+o2*o1','Nadj+S+OW+X'); 


%% Actually fit and compare the models...

% Variables to store the results:
Rsquared = zeros(size(modelList,1),numel(t.oplist));
SSresid = zeros(size(modelList,1),numel(t.oplist));
Fstat = zeros(size(testPairs,1),numel(t.oplist));
df1 = zeros(size(testPairs,1),numel(t.oplist));
df2 = zeros(size(testPairs,1),numel(t.oplist));
coeffs = zeros(max(cell2mat(Xcols(:,3)')),numel(t.oplist));
issig = zeros(max(cell2mat(Xcols(:,3)')),numel(t.oplist));
FstatMod = zeros(size(modelList,1),numel(t.oplist));
disp(max(cell2mat(Xcols(:,3)')))
for ip = 1:numel(t.oplist)
    % filter from traces the trace values for opcode==ip
    filter = t.opcodes(:,2)==ip;
    
    trace = t.trace(filter,:);
    state = ss.state_input(filter,1);
    state_type = ss.state_type(filter,1);
    disp(size(state,1))

    opcodes = t.opcodes(filter,:);
    input = cell(3,1);
 
    % filter input rows related to the same opcodes (where current inst. is
    % ip)
    for inp = 1:3
        input{inp} = t.input{inp}(filter,:);
    end
    dummyI1 = dummyvar(opcodes(:,1));
    %disp(dummyI1);
    
    dummyI3 = dummyvar(opcodes(:,3));

    %dummyIS=zeros(numel(opcodes(:,3)), nIS);
    all_states=zeros(numel(opcodes(:,3)), nIS-1);
    
    %dummyIS(state_type == 1,1)=1;
    %dummyIS(state_type == 2,2)=1;
    %dummyIS(state_type == 3,3)=1;
    %dummyIS(state_type == 4,4)=1;
    %dummyIS(state_type == 5,5)=1;
    
    all_states(state_type == 1,1)=bitxor(state(state_type == 1), input{2}(state_type == 1,2));
    all_states(state_type == 1 & opcodes(:,1) == 3,1)=bitxor(input{1}(state_type == 1 & opcodes(:,1) == 3,2), input{2}(state_type == 1 & opcodes(:,1) == 3,2));
    
    all_states(state_type == 2,2)=bitxor(state(state_type == 2), input{2}(state_type == 2,2));
    all_states(state_type == 2 & opcodes(:,1) == 4,2)=bitxor(input{1}(state_type == 2 & opcodes(:,1) == 4,2), input{2}(state_type == 2 & opcodes(:,1) == 4,2));
    
    all_states(state_type == 3,3)=bitxor(state(state_type == 3), input{2}(state_type == 3,2));
    all_states(state_type == 3 & opcodes(:,1) == 1,3)=bitxor(input{1}(state_type == 3 & opcodes(:,1) == 1,2), input{2}(state_type == 3 & opcodes(:,1) == 1,2));
    all_states(state_type == 3 & opcodes(:,1) == 2,3)=bitxor(input{1}(state_type == 3 & opcodes(:,1) == 2,2), input{2}(state_type == 3 & opcodes(:,1) == 2,2));
    
    all_states(state_type == 4,4)=bitxor(state(state_type == 4), input{2}(state_type == 4,2));
    all_states(state_type == 4 & opcodes(:,1) == 5,4)=bitxor(input{1}(state_type == 4 & opcodes(:,1) == 5,2), input{2}(state_type == 4 & opcodes(:,1) == 5,2));
    
    all_states(state_type == 5,1)=0;
    all_states(state_type == 5 & opcodes(:,1) == 3,1)=bitxor(input{1}(state_type == 5 & opcodes(:,1) == 3,2), input{2}(state_type == 5 & opcodes(:,1) == 3,2));
    
    all_states(state_type == 5,2)=0;
    all_states(state_type == 5 & opcodes(:,1) == 4,1)=bitxor(input{1}(state_type == 5 & opcodes(:,1) == 4,2), input{2}(state_type == 5 & opcodes(:,1) == 4,2));
    
    all_states(state_type == 5,3)=0;
    all_states(state_type == 5 & opcodes(:,1) == 1,1)=bitxor(input{1}(state_type == 5 & opcodes(:,1) == 1,2), input{2}(state_type == 5 & opcodes(:,1) == 1,2));
    
    all_states(state_type == 5,4)=0;
    all_states(state_type == 5 & opcodes(:,1) == 5,1)=bitxor(input{1}(state_type == 5 & opcodes(:,1) == 5,2), input{2}(state_type == 5 & opcodes(:,1) == 5,2));
    
    %disp([dummyvar(opcodes(:,1)),CCC])
    %disp(all_states);
    %return;
    % prep A for a single inst(opcode)
    A = zeros(size(trace,1),max(cell2mat(Xcols(:,3)')));

    A(:,Xcols{strcmpi(Xcols(:,1),'Const'),3}) = 1;
    A(:,Xcols{strcmpi(Xcols(:,1),'I1'),3}) = dummyI1(:,2:end);
    A(:,Xcols{strcmpi(Xcols(:,1),'I3'),3}) = dummyI3(:,2:end);
    % Design matrices for the regression equations with dummies for each
    % input bit/transition:
    for bit = 1:32
        % Bits of the first input to the second instruction:
        A(:,Xcols{strcmpi(Xcols(:,1),'o1'),3}(bit)) = bitget(input{2}(:,1),bit);
        % Bits of the second input to the second instruction:
        A(:,Xcols{strcmpi(Xcols(:,1),'o2'),3}(bit)) = bitget(input{2}(:,2),bit);
        % Bit transitions of the first inputs to the first and second
        % instructions:
        A(:,Xcols{strcmpi(Xcols(:,1),'t1'),3}(bit)) = bitget(bitxor(input{2}(:,1),input{1}(:,1)),bit);
        % Bit transitions of the second inputs to the first and second
        % instructions:
        A(:,Xcols{strcmpi(Xcols(:,1),'t2'),3}(bit)) = bitget(bitxor(input{2}(:,2),input{1}(:,2)),bit);
    end
    % To minimise complexity, the interaction terms are wrt the Hamming
    % weights and distances (as above) rather than the bits:
    A(:,Xcols{strcmpi(Xcols(:,1),'D*I1'),3}) = cell2mat(arrayfun(@(x) ...
        bsxfun(@times,[HW(input{2}),HW(bitxor(input{2},input{1}))],dummyI1(:,x)),2:size(dummyI1,2),'UniformOutput',0));
    A(:,Xcols{strcmpi(Xcols(:,1),'D*I3'),3}) = cell2mat(arrayfun(@(x) ...
        bsxfun(@times,[HW(input{2}),HW(bitxor(input{2},input{1}))],dummyI3(:,x)),2:size(dummyI3,2),'UniformOutput',0));
    % Second order data terms:
    for j = 1:size(pairs,1)
        A(:,Xcols{strcmpi(Xcols(:,1),'o1int'),3}(j)) = A(:,Xcols{strcmpi(Xcols(:,1),'o1'),3}(pairs(j,1)))...
            .*A(:,Xcols{strcmpi(Xcols(:,1),'o1'),3}(pairs(j,2)));
        A(:,Xcols{strcmpi(Xcols(:,1),'o2int'),3}(j)) = A(:,Xcols{strcmpi(Xcols(:,1),'o2'),3}(pairs(j,1)))...
            .*A(:,Xcols{strcmpi(Xcols(:,1),'o2'),3}(pairs(j,2)));
        A(:,Xcols{strcmpi(Xcols(:,1),'t1int'),3}(j)) = A(:,Xcols{strcmpi(Xcols(:,1),'t1'),3}(pairs(j,1)))...
            .*A(:,Xcols{strcmpi(Xcols(:,1),'t1'),3}(pairs(j,2)));
        A(:,Xcols{strcmpi(Xcols(:,1),'t2int'),3}(j)) = A(:,Xcols{strcmpi(Xcols(:,1),'t2'),3}(pairs(j,1)))...
            .*A(:,Xcols{strcmpi(Xcols(:,1),'t2'),3}(pairs(j,2)));
    end

    
    %disp(input{2}(:,1));
    %disp(HW(bitxor(state, input{2}(:,1))))l
    % this proves to be lesser fit for the model than HD
    %for bit = 1:32
    %     Bits of the first input to the second instruction:
    %    A(:,Xcols{strcmpi(Xcols(:,1),'s'),3}(bit)) = bitget(state(:,1),bit);
    %end
    %mm=zeros(numel(opcodes(:,3)),20);
    for j = 1:4
        for bit = 1:32
            A(state_type == j, Xcols{strcmpi(Xcols(:,1),'s'),3}(32*(j-1)+bit)) =bitget(uint32(all_states(state_type == j,j)), bit); %HW(bitxor(state, input{2}(:,2)));
            
            
        end
    end
    
    A(:,Xcols{strcmpi(Xcols(:,1),'ow'),3}) = HW(bitxor(input{2}(:,1),input{2}(:,2)));
    A(:,Xcols{strcmpi(Xcols(:,1),'o1*o2'),3}) = HW(bitxor(input{1}(:,1),input{2}(:,2)));
    A(:,Xcols{strcmpi(Xcols(:,1),'o2*o1'),3}) = HW(bitxor(input{1}(:,2),input{2}(:,1)));
    %A(:,Xcols{strcmpi(Xcols(:,1),'IS'),3}) = dummyIS(:,1:end-1);
    % Fit each specified model and store the relevant outcome data for
    % analysis and for the simulator:

    for iv = 1:size(modelList,1)
        Atrace = trace;
        [Btemp,BINT,R,RINT,STATS] = regress(Atrace,A(:,modelList{iv,1}));

        % Code to keep track of which models trigger warnings:
        if ~isempty(lastwarn)
            display(sprintf('Target: %s; Model version: %s',t.oplist{ip},modelList{iv,2}));
        end
        lastwarn('');
        % Store the overall model R-squared and compute the residual sum of
        % squares:
        Rsquared(iv,ip) = STATS(1);
        SSresid(iv,ip) = sum(R.^2);

        % N.B. THIS CONTROLS WHAT IS OUTPUT AS THE ELMO MODEL IN THE LAST 
        % CELL OF THE SCRIPT SO CHANGE THIS IF YOU WANT SOMETHING
        % DIFFERENT:
        %strcmpi(modelList{iv,2},'I1+I3+D+D*I1+D*I3+o1int+o2int') && ismember(ip,[2,5])) ||...
        % || ...          (strcmpi(modelList{iv,2},'I1+I3+D+D*I1+D*I3') && ~ismember(ip,[1,2,5]))
    
        %if ((strcmpi(modelList{iv,2},'I1+I3+D+D*I1+D*I3+o1int+o2int+s+ow')))
                       
        %end
        if ((strcmpi(modelList{iv,2},'I1+I3+D+D*I1+D*I3+o1int+o2int+s+ow+o1*o2+o2*o1') && ismember(ip,[2,5])) || ...
                (strcmpi(modelList{iv,2},'I1+I3+D+D*I1+D*I3+s+ow+o1*o2+o2*o1') && ~ismember(ip,[2,5])))
            coeffs(modelList{iv,1},ip) = Btemp;
            disp(Rsquared(iv,ip));
        end
        
%         if ((strcmpi(modelList{iv,2},'I1+I3+D+D*I1+D*I3+o1int+o2int') && ismember(ip,[2,5])) || ...
%                 (strcmpi(modelList{iv,2},'I1+I3+D+D*I1+D*I3') && ~ismember(ip,[2,5])) )
%             coeffs(modelList{iv,1},ip) = Btemp;
%         end
    end    
    
    % Compute the degrees of freedom and the F-statistic associated with
    % the specified nested model comparisons:
    
    for tp = 1:size(testPairs,1)
        df1(tp,ip) = numel(modelList{testPairs{tp,4}(2),1})-numel(modelList{testPairs{tp,4}(1),1});
        df2(tp,ip) = size(trace,1)-numel(modelList{testPairs{tp,4}(2),1});
        Fstat(tp,ip) = ((SSresid(testPairs{tp,4}(1),ip)-SSresid(testPairs{tp,4}(2),ip))./df1(tp,ip))./...
            (SSresid(testPairs{tp,4}(1),ip)./df2(tp,ip));
    end
    % Compute the F-statistic for the overall significance of the each of
    % the fitted models:
    for xmod = 1:size(modelList,1)
        FstatMod(xmod,ip) = (Rsquared(xmod,ip)/(1-Rsquared(xmod,ip)))*(size(trace,1)/...
            numel(modelList{xmod,1}));
    end
end
% Specify a significance level (probability of concluding that the added
% variables jointly affect the power consumption when in fact the null
% hypothesis is true):
alpha = 0.05;
% Derive the critical values of the null distribution determined by the
% degrees of freedom associated with each model comparison:
CritVal = zeros(size(testPairs,1),1);
for tp = 1:size(testPairs,1)
    CritVal(tp,:) = finv(1-alpha,df1(tp,1),df2(tp,1));
end

% Derive the critical values of the null distribution determined by the
% degrees of freedom of each model relative to the null model (i.e. to test
% the significance of the full model):
CritValMod = zeros(size(modelList,1),1);
for tp = 1:size(modelList,1)
    CritValMod(tp,:) = finv(1-alpha,numel(modelList{tp,1})-1,size(trace,1)-numel(modelList{tp,1}));
end

%% Table of F-test outcomes

% This code prints the commands for a LaTeX table to the display. Simply
% copy and paste into a .tex document, and edit the formatting as
% required. (Alternatively, adapt to write to a text file if preferred).

% Begin table environment and specify number of columns:
display('\begin{table}[!ht]');
display('\begin{tabular}{l | r r r r r}');
% Column headings:
display(['\textbf{Tested effects (df1,df2)} ',sprintf('& \\textbf{{\\tt %s}} ',t.oplist{:}),'\\']);
display([repmat('& ',1,numel(t.oplist)),'\\']);
display('\hline');
% Display the data:
for row = 1:size(Fstat,1)
    tablerow = sprintf('%s \\small{(%.0f,%.0f)}',testPairs{row,3},df1(row,1),df2(row,1));
    for col = 1:size(Fstat,2)
        if Fstat(row,col)<CritVal(row)
            % & {\\cellcolor[gray]{0.75}}
            tablerow = [tablerow,sprintf('& {\\cellcolor[gray]{0.75}} %.3f ',Fstat(row,col))];
        else
            tablerow = [tablerow,sprintf('& %.3f ',Fstat(row,col))];
        end
    end
    display([tablerow,'\\']);
end
display('\hline');
display('\end{tabular}');
% Include a caption:
display('\caption{Outcomes of F-tests for different nested model comparisons. \label{tab:Ftests}}');
display('\end{table}');


save('coeffs.mat','coeffs');
