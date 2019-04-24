function varargout = Data_type_generating(varargin)
% DATA_TYPE_GENERATING MATLAB code for Data_type_generating.fig
%      DATA_TYPE_GENERATING, by itself, creates a new DATA_TYPE_GENERATING or raises the existing
%      singleton*.
%
%      H = DATA_TYPE_GENERATING returns the handle to a new DATA_TYPE_GENERATING or the handle to
%      the existing singleton*.
%
%      DATA_TYPE_GENERATING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_TYPE_GENERATING.M with the given input arguments.
%
%      DATA_TYPE_GENERATING('Property','Value',...) creates a new DATA_TYPE_GENERATING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Data_type_generating_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Data_type_generating_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Data_type_generating

% Last Modified by GUIDE v2.5 30-Nov-2016 11:42:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Data_type_generating_OpeningFcn, ...
                   'gui_OutputFcn',  @Data_type_generating_OutputFcn, ...
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


% --- Executes just before Data_type_generating is made visible.
function Data_type_generating_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Data_type_generating (see VARARGIN)

% Choose default command line output for Data_type_generating
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Data_type_generating wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Data_type_generating_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_cov.
function pushbutton_cov_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cov (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_type
switch Data_type
    case 1
        Covariance_matrix;
        handles=guihandles;
        load('fileData.mat');
        f_parameter.Covariance = [30 -2 2 1];
        save ('fileData','f_parameter');
    case 2
        Covariance_matrix;
        handles=guihandles;
        load('fileData.mat');
        f_parameter.Covariance = [30 -2 2 1];
        save ('fileData','f_parameter');
    case 3
        Random_model;
        load('fileData.mat');
        f_parameter.Dpmodel = [3 1 1 1 -10;0 0 0 0 10];
        save ('fileData','f_parameter');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Training_data;
handles=guihandles;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fault_model;
handles=guihandles;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
close all;
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Data_type_selecting;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_type
load('fileData');
switch Data_type
    case 1
        if isfield(f_parameter,'Covariance') == 0
            errordlg('Have not set parameter for covariance matrix yet. ','Error');
        else
            if isfield(f_parameter,'Sample_Size') == 0
                errordlg('Have not set sample size yet. ','Error');
            else
                %if isfield(f_parameter,'Fault_range') == 0   
                %    errordlg('Have not set parameter for fault detection yet. ','Error');
                %else
                 close;
                 Method_selection;
                %end
            end
        end
    case 2
        if isfield(f_parameter,'Covariance') == 0
            errordlg('Have not set parameter for covariance matrix yet. ','Error');
        else
            if isfield(f_parameter,'Sample_Size') == 0
                errordlg('Have not set sample size yet. ','Error');
            else
                %if isfield(f_parameter,'Fault_range') == 0   
                %    errordlg('Have not set parameter for fault detection yet. ','Error');
                %else
                 close;
                 Method_selection;
                %end
            end
        end
        
    case 3
        if isfield(f_parameter,'Dpmodel') == 0
            errordlg('Have not set parameter for random model yet. ','Error');
        else

                %if isfield(f_parameter,'Fault_range') == 0   
                %    errordlg('Have not set parameter for fault detection yet. ','Error');
                %else
                 close;
                 Method_selection;
                %end
        end
end

% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
switch Data_type
    case 1
        set(hObject,'String','Data generate ( type I )');
    case 2
        set(hObject,'String','Data generate ( type II )');
    case 3
        set(hObject,'String','Data generate ( type III )');
end


% --- Executes on button press in pushbutton_model.
function pushbutton_model_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Random_model;
handles=guihandles;


% --- Executes during object creation, after setting all properties.
function pushbutton_cov_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton_cov (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns calledg
global Data_type
switch Data_type
    case 1 
        set(hObject,'String','Normal Data');
    case 2 
        set(hObject,'String','Normal Data');
    case 3
        set(hObject,'String','Random Model');
end

% --- Executes during object creation, after setting all properties.
function pushbutton_model_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton_model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type

if Data_type ==3

set(hObject,'Visible','on');
set(hObject,'Position',[14.8 21.07142857142857 40.2 3.7142857142857153]);

else 
    set(hObject,'Visible','off');
end
