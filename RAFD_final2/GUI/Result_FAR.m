function varargout = Result_FAR(varargin)
% RESULT_FAR MATLAB code for Result_FAR.fig
%      RESULT_FAR, by itself, creates a new RESULT_FAR or raises the existing
%      singleton*.
%
%      H = RESULT_FAR returns the handle to a new RESULT_FAR or the handle to
%      the existing singleton*.
%
%      RESULT_FAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULT_FAR.M with the given input arguments.
%
%      RESULT_FAR('Property','Value',...) creates a new RESULT_FAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Result_FAR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Result_FAR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Result_FAR

% Last Modified by GUIDE v2.5 28-Mar-2017 15:19:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Result_FAR_OpeningFcn, ...
                   'gui_OutputFcn',  @Result_FAR_OutputFcn, ...
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


% --- Executes just before Result_FAR is made visible.
function Result_FAR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Result_FAR (see VARARGIN)

% Choose default command line output for Result_FAR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Result_FAR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Result_FAR_OutputFcn(hObject, eventdata, handles) 
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
    Result_FAR;
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
function text_wFAR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_wFAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load('fileData.mat');
if f_parameter.Estimation_method(1,1)==1
    set(hObject,'Visible','On');
    set(hObject,'String',num2str(f_parameter.FAR_estimation(1,1)));
else
    set(hObject,'Visible','Off');
end


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load('fileData.mat');
if f_parameter.Estimation_method(1,1)==1
    set(hObject,'Visible','On');
else
    set(hObject,'Visible','Off');
end


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
load('fileData.mat');
% Create column names
switch Data_type
    case 1
            if f_parameter.Detection_method == [1 0 0 0]
                cnames = {'GLR'}; 
            elseif f_parameter.Detection_method == [1 1 0 0]
                cnames = {'GLR','PCA'};
            elseif f_parameter.Detection_method == [0 1 0 0]
                cnames = {'PCA'}; 
            end
    case 2
            if f_parameter.Detection_method == [1 0 0 0]
                cnames = {'PLS'}; 
            elseif f_parameter.Detection_method == [1 1 0 0]
                cnames = {'PLS','CCA'};
            elseif f_parameter.Detection_method == [1 1 1 0]
                cnames = {'PLS','CCA','LS'};
            elseif f_parameter.Detection_method == [0 1 0 0]
                cnames = {'CCA'}; 
            elseif f_parameter.Detection_method == [0 1 1 0]
                cnames = {'CCA','LS'}; 
            elseif f_parameter.Detection_method == [0 0 1 0]
                cnames = {'LS'}; 
            elseif f_parameter.Detection_method == [1 0 1 0]
                cnames = {'PLS','LS'}; 
            end
    case 3
        if f_parameter.Detection_method == [1 0 0 0]
                cnames = {'CCA'}; 
            elseif f_parameter.Detection_method == [1 1 0 0]
                cnames = {'CCA','dPCA'};
            elseif f_parameter.Detection_method == [0 1 0 0]
                cnames = {'dPCA'}; 
            end
        
end
% Create uitable
set(hObject,'Data',f_parameter.Result{1},'ColumnName',cnames);


% --- Executes on button press in pushbutton_back.
function pushbutton_back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
switch Data
    case 1
        
    case 2
        close;
        Method_selection;
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Threshold_setting;


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
