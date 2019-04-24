function varargout = Finished(varargin)
% FINISHED MATLAB code for Finished.fig
%      FINISHED, by itself, creates a new FINISHED or raises the existing
%      singleton*.
%
%      H = FINISHED returns the handle to a new FINISHED or the handle to
%      the existing singleton*.
%
%      FINISHED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINISHED.M with the given input arguments.
%
%      FINISHED('Property','Value',...) creates a new FINISHED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Finished_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Finished_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Finished

% Last Modified by GUIDE v2.5 11-May-2017 13:47:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Finished_OpeningFcn, ...
                   'gui_OutputFcn',  @Finished_OutputFcn, ...
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


% --- Executes just before Finished is made visible.
function Finished_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Finished (see VARARGIN)

% Choose default command line output for Finished
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Finished wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Finished_OutputFcn(hObject, eventdata, handles) 
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
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
close all;
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uiputfile('*.mat','Save fault model');
if FileName~=0
    load('fileData.mat');
    Fault_Pattern= f_parameter.Fault_Pattern;
    Pattern_pro= f_parameter.Pattern_pro;
    Hidden_pro= f_parameter.Hidden_pro;
    Fault_Number= f_parameter.Fault_Number;
    Pattern_Nr= f_parameter.Pattern_Nr;
    Cause_Nr= f_parameter.Cause_Nr;
    Fault_function= f_parameter.Fault_function;
    Fault_range= f_parameter.Fault_range;
    save([ PathName FileName ],'Fault_Pattern','Pattern_pro','Hidden_pro','Fault_Number',...
                                'Pattern_Nr','Cause_Nr','Fault_function','Fault_range');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
c=questdlg('Fault data is generated. What is the next step?','Next','Fault detection','Save fault data','Fault detection');
handles=guihandles;
if strcmp(c,'Fault detection')
    close;
    switch Data
        case 1
            Fault_position_mb;
        case 2
            Fault_position;
    end
else
    [FileName,PathName,FilterIndex] = uiputfile('*.mat','fileData');
    if isequal(FileName,0)
        Finished;
    else
        load('fileData');
        load('customData');
        [fault_data probability] = fault_data_gen_save(f_parameter,c_parameter,f_parameter.Sample_Size,100,0.01);
        Fault_data = [fault_data probability];
        save([ PathName FileName ], 'Fault_data');
        f_parameter.fault_data = fault_data;
        f_parameter.probability = probability;
        save('fileData','f_parameter');
    end
end



% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Structure_layer;


% --- Executes on button press in pushbutton_back.
function pushbutton_back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Fault_model;
