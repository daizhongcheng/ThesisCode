function varargout = Fault_position(varargin)
% FAULT_POSITION MATLAB code for Fault_position.fig
%      FAULT_POSITION, by itself, creates a new FAULT_POSITION or raises the existing
%      singleton*.
%
%      H = FAULT_POSITION returns the handle to a new FAULT_POSITION or the handle to
%      the existing singleton*.
%
%      FAULT_POSITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAULT_POSITION.M with the given input arguments.
%
%      FAULT_POSITION('Property','Value',...) creates a new FAULT_POSITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fault_position_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fault_position_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fault_position

% Last Modified by GUIDE v2.5 22-Feb-2017 13:53:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fault_position_OpeningFcn, ...
                   'gui_OutputFcn',  @Fault_position_OutputFcn, ...
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


% --- Executes just before Fault_position is made visible.
function Fault_position_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fault_position (see VARARGIN)

% Choose default command line output for Fault_position
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fault_position wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fault_position_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popup_f1.
function popup_f1_Callback(hObject, eventdata, handles)
% hObject    handle to popup_f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_f1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_f1


% --- Executes during object creation, after setting all properties.
function popup_f1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Data_type
load('fileData.mat');
switch Data_type
    case 1
        position = f_parameter.Covariance(1);
    case 2
        position = f_parameter.Covariance(1);
    case 3
        position = sum(f_parameter.Dpmodel(1,2)+f_parameter.Dpmodel(1,3));
end
text{1}= 'On which measurement occurs the fault';
for i = 1:position
    text{i+1}= num2str(i);
end
set(hObject,'String',text);


% --- Executes on selection change in popup_f2.
function popup_f2_Callback(hObject, eventdata, handles)
% hObject    handle to popup_f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_f2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_f2


% --- Executes during object creation, after setting all properties.
function popup_f2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Fault_Number Data_type


% if the custom load fault model
load('customData.mat');
if c_parameter.Choice(5,1)==1 
   Fault_Number= c_parameter.Fault_Number;
end

if Fault_Number >1
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end

load('fileData.mat');
switch Data_type
    case 1
        position = f_parameter.Covariance(1);
    case 2
        position = f_parameter.Covariance(1);
    case 3
        position = sum(f_parameter.Dpmodel(1,2)+f_parameter.Dpmodel(1,3));
end
text{1}= 'On which measurement occurs the fault';
for i = 1:position
    text{i+1}= num2str(i);
end
set(hObject,'String',text);


% --- Executes on selection change in popup_f3.
function popup_f3_Callback(hObject, eventdata, handles)
% hObject    handle to popup_f3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_f3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_f3


% --- Executes during object creation, after setting all properties.
function popup_f3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_f3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Fault_Number Data_type

% if the custom load fault model
load('customData.mat');
if c_parameter.Choice(5,1)==1 
   Fault_Number= c_parameter.Fault_Number;
end

if Fault_Number >2
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end

load('fileData.mat');
switch Data_type
    case 1
        position = f_parameter.Covariance(1);
    case 2
        position = f_parameter.Covariance(1);
    case 3
        position = sum(f_parameter.Dpmodel(1,2)+f_parameter.Dpmodel(1,3));
end
text{1}= 'On which measurement occurs the fault';
for i = 1:position
    text{i+1}= num2str(i);
end
set(hObject,'String',text);


% --- Executes on button press in ck_f1a.
function ck_f1a_Callback(hObject, eventdata, handles)
% hObject    handle to ck_f1a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ck_f1a
set(handles.ck_f1m,'Value',0);

% --- Executes on button press in ck_f1m.
function ck_f1m_Callback(hObject, eventdata, handles)
% hObject    handle to ck_f1m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ck_f1m
set(handles.ck_f1a,'Value',0);

% --- Executes on button press in ck_f2a.
function ck_f2a_Callback(hObject, eventdata, handles)
% hObject    handle to ck_f2a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ck_f2a
set(handles.ck_f2m,'Value',0);

% --- Executes on button press in ck_f2m.
function ck_f2m_Callback(hObject, eventdata, handles)
% hObject    handle to ck_f2m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ck_f2m
set(handles.ck_f2a,'Value',0);

% --- Executes on button press in ck_f3a.
function ck_f3a_Callback(hObject, eventdata, handles)
% hObject    handle to ck_f3a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ck_f3a
set(handles.ck_f3m,'Value',0);

% --- Executes on button press in ck_f3m.
function ck_f3m_Callback(hObject, eventdata, handles)
% hObject    handle to ck_f3m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ck_f3m
set(handles.ck_f3a,'Value',0);

% --- Executes on button press in pushbutton_close.
function pushbutton_close_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
    close all;
end


% --- Executes on button press in pushbutton_next.
function pushbutton_next_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fault_Number
p1 = get(handles.popup_f1,'Value')-1;
p2 = get(handles.popup_f2,'Value')-1;
p3 = get(handles.popup_f3,'Value')-1;
f1a = get(handles.ck_f1a,'Value');
f1m = get(handles.ck_f1m,'Value');
f2a = get(handles.ck_f2a,'Value');
f2m = get(handles.ck_f2m,'Value');
f3a = get(handles.ck_f3a,'Value');
f3m = get(handles.ck_f3m,'Value');
P_err = 0;
T_err = 0;

switch Fault_Number
    case 1
        if p1==0
            P_err = 1;
        end
        if (f1a==0)&&(f1m==0)
            T_err = 1;
        end
    case 2
        if (p1==0)||(p2==0)
            P_err = 1;
        end
        if (f2a==0)&&(f2m==0)
            T_err = 1;
        end
    case 3
        if (p1==0)||(p2==0)||(p3==0)
            P_err = 1;
        end
        if (f3a==0)&&(f3m==0)
            T_err = 1;
        end
end

if P_err == 1
    errordlg('Please choose fault position.','Error');
else
    if T_err == 1
        errordlg('Please choose fault type.','Error');
    else
        load('fileData.mat');
        f_parameter.Fault_position = [p1 f1a f1m;p2 f2a f2m;p3 f3a f3m];
        save ('fileData','f_parameter');
        close;
    end
end

% --- Executes on button press in pushbutton_back.
function pushbutton_back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
switch Data
    case 1
        close;
        Selections;
    case 2
        close;
        Finished;
end


% --- Executes during object creation, after setting all properties.
function text_f2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >1
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function text_f2t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_f2t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >1
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function text_f3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_f3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >2
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function text_f3t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_f3t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >2
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function ck_f1a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ck_f1a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text_f1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function ck_f2a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ck_f2a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >1
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function ck_f2m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ck_f2m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >1
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function ck_f3a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ck_f3a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >2
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function ck_f3m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ck_f3m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >2
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end
