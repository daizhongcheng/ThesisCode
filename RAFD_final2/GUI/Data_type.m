 function varargout = Data_type(varargin)
% DATA_TYPE MATLAB code for Data_type.fig
%      DATA_TYPE, by itself, creates a new DATA_TYPE or raises the existing
%      singleton*.
%
%      H = DATA_TYPE returns the handle to a new DATA_TYPE or the handle to
%      the existing singleton*.
%
%      DATA_TYPE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_TYPE.M with the given input arguments.
%
%      DATA_TYPE('Property','Value',...) creates a new DATA_TYPE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Data_type_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Data_type_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Data_type

% Last Modified by GUIDE v2.5 05-Jul-2016 11:44:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Data_type_OpeningFcn, ...
                   'gui_OutputFcn',  @Data_type_OutputFcn, ...
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


% --- Executes just before Data_type is made visible.
function Data_type_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Data_type (see VARARGIN)

% Choose default command line output for Data_type
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Data_type wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Data_type_OutputFcn(hObject, eventdata, handles) 
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
clear;
clc;
global Data
Data = 1;
f_parameter.Data = Data;
c_parameter.Data = Data;
c_parameter.Choice = zeros(5,4);
save ('fileData','f_parameter');
save ('customData','c_parameter');
close;
Model_generating;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
Data = 2;
f_parameter.Data = Data;
c_parameter.Data = Data;
c_parameter.Choice = zeros(5,4);
save ('fileData','f_parameter');
save ('customData','c_parameter');
close;
Data_type_selecting;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
close all;
end
