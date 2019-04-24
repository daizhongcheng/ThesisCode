function varargout = Uncertainty(varargin)
% UNCERTAINTY MATLAB code for Uncertainty.fig
%      UNCERTAINTY, by itself, creates a new UNCERTAINTY or raises the existing
%      singleton*.
%
%      H = UNCERTAINTY returns the handle to a new UNCERTAINTY or the handle to
%      the existing singleton*.
%
%      UNCERTAINTY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNCERTAINTY.M with the given input arguments.
%
%      UNCERTAINTY('Property','Value',...) creates a new UNCERTAINTY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Uncertainty_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Uncertainty_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Uncertainty

% Last Modified by GUIDE v2.5 04-May-2017 11:38:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Uncertainty_OpeningFcn, ...
                   'gui_OutputFcn',  @Uncertainty_OutputFcn, ...
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


% --- Executes just before Uncertainty is made visible.
function Uncertainty_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Uncertainty (see VARARGIN)

% Choose default command line output for Uncertainty
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Uncertainty wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Uncertainty_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_para.
function pushbutton_para_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('fileData.mat');
f_parameter.Uncertainty = {};
f_parameter.Uncertainty{1} = zeros(1,6);
f_parameter.Uncertainty{2} = zeros(1,6);
f_parameter.Uncertainty{3} = zeros(3,6);
f_parameter.Uncertainty{4} = zeros(3,6);
f_parameter.Uncertainty{5} = zeros(3,6);
f_parameter.Uncertainty{6} = zeros(3,6);
f_parameter.Uncertainty{7} = zeros(3,6);
f_parameter.Uncertainty{8} = zeros(3,6);
save ('fileData','f_parameter'); 
load('customData.mat');
c_parameter.Choice(3,1:2) = [0 1];
% there is no load selection for parameter uncertainty, so to make it
% always generate by GUI here.
c_parameter.Choice(3,4) = 1;
save ('customData','c_parameter');
close(gcf);
Para_uncertainty;
handles=guihandles;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('fileData.mat');
f_parameter.Uncertainty = {};
f_parameter.Uncertainty{1} = zeros(1,6);
f_parameter.Uncertainty{2} = zeros(12,3);
f_parameter.Uncertainty{3} = zeros(12,3);
f_parameter.Uncertainty{4} = zeros(12,3);
f_parameter.Uncertainty{5} = zeros(12,3);
f_parameter.Uncertainty{6} = zeros(12,3);
f_parameter.Uncertainty{7} = zeros(12,3);
save ('fileData','f_parameter'); 
load('customData.mat');
c_parameter.Choice(3,1:2) = [1 0];
save ('customData','c_parameter');
close(gcf);
Poly_uncertainty;
handles=guihandles;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
