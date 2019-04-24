function varargout = Fault_model(varargin)
% FAULT_MODEL MATLAB code for Fault_model.fig
%      FAULT_MODEL, by itself, creates a new FAULT_MODEL or raises the existing
%      singleton*.
%
%      H = FAULT_MODEL returns the handle to a new FAULT_MODEL or the handle to
%      the existing singleton*.
%
%      FAULT_MODEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAULT_MODEL.M with the given input arguments.
%
%      FAULT_MODEL('Property','Value',...) creates a new FAULT_MODEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fault_model_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fault_model_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fault_model

% Last Modified by GUIDE v2.5 23-Jun-2017 13:16:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fault_model_OpeningFcn, ...
                   'gui_OutputFcn',  @Fault_model_OutputFcn, ...
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


% --- Executes just before Fault_model is made visible.
function Fault_model_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fault_model (see VARARGIN)

% Choose default command line output for Fault_model
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fault_model wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fault_model_OutputFcn(hObject, eventdata, handles) 
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
close;
Selections;

% --- Executes on button press in push_load1.
function push_load1_Callback(hObject, eventdata, handles)
% hObject    handle to push_load1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
[filename,pathname]=uigetfile(['*.mat'],'Please choose file.');
str=[pathname,filename];
if ((filename==0) & (pathname==0))
    msgbox('You have not chosen any file.','Error open file','error');
else
    data=load (strcat([pathname filename]));
    load('customData.mat');
     c_parameter.Fault_Pattern =  data.Fault_Pattern;
     c_parameter.Pattern_pro =  data.Pattern_pro ;
     c_parameter.Hidden_pro =  data.Hidden_pro;
     c_parameter.Fault_Number =  data.Fault_Number;
     c_parameter.Pattern_Nr =  data.Pattern_Nr;
     c_parameter.Cause_Nr =  data.Cause_Nr;
     c_parameter.Fault_function =  data.Fault_function;
     c_parameter.Fault_range = data.Fault_range ;
     % save choice
     c_parameter.Choice(5,1:3) =  [1 0 0];
    save ('customData','c_parameter');
    switch Data
    case 1
        close;
        Fault_position_mb;
    case 2
        close;
        Fault_position;
end
end


% --- Executes on button press in push_generate.
function push_generate_Callback(hObject, eventdata, handles)
% hObject    handle to push_generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('customData.mat');
% save choice
c_parameter.Choice(5,1:3) =  [0 0 1];
save ('customData','c_parameter');
close;
Structure_layer;


% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data
switch Data
    case 1 
        set(hObject,'Visible','On');
    case 2
        set(hObject,'Visible','Off');
end


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in push_load2.
function push_load2_Callback(hObject, eventdata, handles)
% hObject    handle to push_load2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
