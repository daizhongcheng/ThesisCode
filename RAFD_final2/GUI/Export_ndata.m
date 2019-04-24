function varargout = Export_ndata(varargin)
% EXPORT_NDATA MATLAB code for Export_ndata.fig
%      EXPORT_NDATA, by itself, creates a new EXPORT_NDATA or raises the existing
%      singleton*.
%
%      H = EXPORT_NDATA returns the handle to a new EXPORT_NDATA or the handle to
%      the existing singleton*.
%
%      EXPORT_NDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXPORT_NDATA.M with the given input arguments.
%
%      EXPORT_NDATA('Property','Value',...) creates a new EXPORT_NDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Export_ndata_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Export_ndata_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Export_ndata

% Last Modified by GUIDE v2.5 17-Mar-2017 14:10:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Export_ndata_OpeningFcn, ...
                   'gui_OutputFcn',  @Export_ndata_OutputFcn, ...
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


% --- Executes just before Export_ndata is made visible.
function Export_ndata_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Export_ndata (see VARARGIN)

% Choose default command line output for Export_ndata
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Export_ndata wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Export_ndata_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_unc.
function pushbutton_unc_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_unc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_type
load('fileData.mat');
switch Data_type
    case 1
        [FileName,PathName,FilterIndex] = uiputfile('*.mat','fileData');
    if isequal(FileName,0)
        Export_ndata;
    else
       [~,data_with_uncertianty,~] = data_with_uncertianty_generation(f_parameter.Covariance(1),...
                                                               f_parameter.Covariance(3),f_parameter.Covariance(2),f_parameter.Sample_Size,1);
       normal_data_unc = data_with_uncertianty;
       save([ PathName FileName ], 'normal_data_unc');
       close(gcf);
    end
    case 2

        [FileName,PathName,FilterIndex] = uiputfile('*.mat','fileData');
    if isequal(FileName,0)
        Export_ndata;
    else
       [~,data_with_uncertianty,quality_with_uncertainty] = data_with_uncertianty_generation(f_parameter.Covariance(1),f_parameter.Covariance(3),...
                                                               f_parameter.Covariance(2),f_parameter.Sample_Size,1,f_parameter.kpi);
       normal_data_unc = [data_with_uncertianty,quality_with_uncertainty];
       save([ PathName FileName ], 'normal_data_unc');
       close(gcf);
    end
end
% f_parameter.normal_data_unc = normal_data_unc;
% save ('fileData','f_parameter');

% --- Executes on button press in pushbutton_nounc.
function pushbutton_nounc_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_nounc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_type
load('fileData.mat');
switch Data_type
    case 1
        [FileName,PathName,FilterIndex] = uiputfile('*.mat','fileData');
    if isequal(FileName,0)
        Export_ndata;
    else
       [data,~,~] = original_data_generation(f_parameter.Covariance(1),...
                                             f_parameter.Covariance(3),f_parameter.Covariance(2),f_parameter.Sample_Size);
       normal_data = data;
       save([ PathName FileName ], 'normal_data');
       close(gcf);
    end
    case 2
        [FileName,PathName,FilterIndex] = uiputfile('*.mat','fileData');
    if isequal(FileName,0)
        Export_ndata;
    else
       [data,~,quality] = original_data_generation(f_parameter.Covariance(1),f_parameter.Covariance(3),...
                                                           f_parameter.Covariance(2),f_parameter.Sample_Size,f_parameter.kpi);
       normal_data = [data,quality];
       save([ PathName FileName ], 'normal_data');
       close(gcf);
    end
end
% f_parameter.normal_data = normal_data;
% save ('fileData','f_parameter');

% --- Executes on button press in pushbutton_dont.
function pushbutton_dont_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_dont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
