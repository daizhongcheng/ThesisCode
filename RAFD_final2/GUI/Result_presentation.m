function varargout = Result_presentation(varargin)
% RESULT_PRESENTATION MATLAB code for Result_presentation.fig
%      RESULT_PRESENTATION, by itself, creates a new RESULT_PRESENTATION or raises the existing
%      singleton*.
%
%      H = RESULT_PRESENTATION returns the handle to a new RESULT_PRESENTATION or the handle to
%      the existing singleton*.
%
%      RESULT_PRESENTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULT_PRESENTATION.M with the given input arguments.
%
%      RESULT_PRESENTATION('Property','Value',...) creates a new RESULT_PRESENTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Result_presentation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Result_presentation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Result_presentation

% Last Modified by GUIDE v2.5 10-Mar-2017 11:39:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Result_presentation_OpeningFcn, ...
                   'gui_OutputFcn',  @Result_presentation_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Result_presentation is made visible.
function Result_presentation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Result_presentation (see VARARGIN)

% Choose default command line output for Result_presentation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Result_presentation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Result_presentation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uiputfile('*.mat','fileData');
if isequal(FileName,0)
    Result_presentation;
else
    load('fileData.mat');
    save([ PathName FileName ], 'f_parameter');
    close;
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
Start;


% --- Executes during object creation, after setting all properties.
function uitable_result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data Data_type
load('fileData.mat');
load('customData.mat');

switch Data
case 2
% Create column names
    switch Data_type
        case 1
                if f_parameter.Detection_method == [1 0 0 0]
                    cnames = {'Probability %','FDR%(GLR)','MT2FD(GLR) '}; 
                elseif f_parameter.Detection_method == [1 1 0 0]
                    cnames = {'Probability %','FDR%(GLR)','FDR%(PCA)','MT2FD(GLR)','MT2FD(PCA)'};
                elseif f_parameter.Detection_method == [0 1 0 0]
                    cnames = {'Probability %','FDR%(PCA)','MT2FD(PCA) '}; 
                end
        case 2
                if f_parameter.Detection_method == [1 0 0 0]
                    cnames = {'Probability %','FDR%(PLS)','MT2FD%(PLS) '}; 
                elseif f_parameter.Detection_method == [1 1 0 0]
                    cnames = {'Probability %','FDR%(PLS)','FDR%(CCA)','MT2FD(PLS)','MT2FD(CCA)'};
                elseif f_parameter.Detection_method == [1 1 1 0]
                    cnames = {'Probability %','FDR%(PLS)','FDR%(CCA)','FDR%(LS)','MT2FD(PLS)','MT2FD(CCA)','MT2FD(LS)'};
                elseif f_parameter.Detection_method == [0 1 0 0]
                    cnames = {'Probability %','FDR%(CCA)','MT2FD(CCA)'}; 
                elseif f_parameter.Detection_method == [0 1 1 0]
                    cnames = {'Probability %','FDR%(CCA)','FDR%(LS)','MT2FD(CCA)','MT2FD(LS)'}; 
                elseif f_parameter.Detection_method == [0 0 1 0]
                    cnames = {'Probability %','FDR%(LS)','MT2FD(LS)'}; 
                elseif f_parameter.Detection_method == [1 0 1 0]
                    cnames = {'Probability %','FDR%(PLS)','FDR%(LS)','MT2FD(PLS)','MT2FD(LS)'}; 
                end
        case 3
                if f_parameter.Detection_method == [1 0 0 0]
                    cnames = {'Probability %','FDR%(CCA)','MT2FD(CCA) '}; 
                elseif f_parameter.Detection_method == [1 1 0 0]
                    cnames = {'Probability %','FDR%(CCA)','FDR%(dPCA)','MT2FD(CCA)','MT2FD(dPCA)'};
                elseif f_parameter.Detection_method == [0 1 0 0]
                    cnames = {'Probability %','FDR%(dPCA)','MT2FD(dPCA) '}; 
                end
    end
        % Create row names
        % if the custom use GUI to generate fault model
        if c_parameter.Choice(5,3)==1 
           Pattern_Nr = f_parameter.Pattern_Nr;
           Pattern_pro = f_parameter.Pattern_pro;
        % if the custom load fault model    
        elseif c_parameter.Choice(5,1)==1
            Pattern_Nr = c_parameter.Pattern_Nr;
            Pattern_pro = c_parameter.Pattern_pro;
        end

        switch Pattern_Nr            
            case 1
                rnames = {'S1','Sum'};
            case 2
                rnames = {'S1','S2','Sum'};
            case 3
                rnames = {'S1','S2','S3','Sum'};
            case 4
                rnames = {'S1','S2','S3','S4','Sum'};
            case 5
                rnames = {'S1','S2','S3','S4','S5','Sum'};
        end

        % Build data
        pro = [Pattern_pro(1:Pattern_Nr) 100]';
        FDR = [];
        MT2FD = [];
        FDR = [f_parameter.Result{4};f_parameter.Result{2}];
        MT2FD = [f_parameter.Result{5};f_parameter.Result{3}];

case 1
    % if the custom use GUI to generate fault model
    if c_parameter.Choice(5,3)==1 
       Pattern_Nr = f_parameter.Pattern_Nr;
       Pattern_pro = f_parameter.Pattern_pro;
    % if the custom load fault model    
    elseif c_parameter.Choice(5,1)==1
       Pattern_Nr = c_parameter.Pattern_Nr;
       Pattern_pro = c_parameter.Pattern_pro;
    end
        
    % Create column names    
    cnames = {'Probability %','FDR%','MT2FD'}; 
    % Create row names
    switch Pattern_Nr            
    case 1
        rnames = {'S1','Sum'};
    case 2
        rnames = {'S1','S2','Sum'};
    case 3
        rnames = {'S1','S2','S3','Sum'};
    case 4
        rnames = {'S1','S2','S3','S4','Sum'};
    case 5
        rnames = {'S1','S2','S3','S4','S5','Sum'};
    end
    
    % Build data
    pro = [Pattern_pro(1:Pattern_Nr) 100]';
    FDR = [];
    MT2FD = [];
    FDR = [f_parameter.Result{3}';f_parameter.Result{1}];
    MT2FD = [f_parameter.Result{4}';f_parameter.Result{2}];
end

data = [pro FDR MT2FD];

% Create uitable
set(hObject,'Data',data,'ColumnName',cnames,'RowName',rnames);
% hObject.Position(3)=hObject.Extent(3);
% hObject.Position(4)=hObject.Extent(4);


% --- Executes during object creation, after setting all properties.
function text_wFAR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_wFAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if f_parameter.Estimation_method(1,1)==1
    set(hObject,'Visible','On');
    set(hObject,'String',num2str(f_parameter.FAR_estimation(1,1)));
else
    set(hObject,'Visible','Off');
end




% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load('fileData.mat');
if f_parameter.Estimation_method(1,1)==1
    set(hObject,'Visible','On');
else
    set(hObject,'Visible','Off');
end


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if f_parameter.Estimation_method(1,1)==1
    set(hObject,'Visible','On');
else
    set(hObject,'Visible','Off');
end


% --- Executes when entered data in editable cell(s) in uitable_result.
function uitable_result_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable_result (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton_back.
function pushbutton_back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
switch Data
    case 1
        close;
        Fault_position_mb;
    case 2
        close;
        Method_selection
end
