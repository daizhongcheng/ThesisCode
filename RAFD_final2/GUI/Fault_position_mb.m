function varargout = Fault_position_mb(varargin)
% FAULT_POSITION_MB MATLAB code for Fault_position_mb.fig
%      FAULT_POSITION_MB, by itself, creates a new FAULT_POSITION_MB or raises the existing
%      singleton*.
%
%      H = FAULT_POSITION_MB returns the handle to a new FAULT_POSITION_MB or the handle to
%      the existing singleton*.
%
%      FAULT_POSITION_MB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAULT_POSITION_MB.M with the given input arguments.
%
%      FAULT_POSITION_MB('Property','Value',...) creates a new FAULT_POSITION_MB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fault_position_mb_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fault_position_mb_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fault_position_mb

% Last Modified by GUIDE v2.5 23-Jun-2017 12:06:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fault_position_mb_OpeningFcn, ...
                   'gui_OutputFcn',  @Fault_position_mb_OutputFcn, ...
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


% --- Executes just before Fault_position_mb is made visible.
function Fault_position_mb_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fault_position_mb (see VARARGIN)

% Choose default command line output for Fault_position_mb
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fault_position_mb wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fault_position_mb_OutputFcn(hObject, eventdata, handles) 
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
position = 30;
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
global Fault_Number
if Fault_Number >1
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end

position = 30;
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
global Fault_Number
if Fault_Number >2
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end

position = 30;
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
Matrix = zeros(3,6);
% additive/multiplictive fault
f1a = get(handles.ck_f1a,'Value');
Matrix(1,5) = f1a;
f1m = get(handles.ck_f1m,'Value');
Matrix(1,6) = f1m;
f2a = get(handles.ck_f2a,'Value');
Matrix(2,5) = f2a;
f2m = get(handles.ck_f2m,'Value');
Matrix(2,6) = f2m;
f3a = get(handles.ck_f3a,'Value');
Matrix(3,5) = f3a;
f3m = get(handles.ck_f3m,'Value');
Matrix(3,6) = f3m;
% fault position
% sensor
if isempty(get(handles.edit_f1_s1,'String')) ~= 1
    Matrix(1,1) = str2double(get(handles.edit_f1_s1,'String'));
end
if isempty(get(handles.edit_f1_s2,'String')) ~= 1
    Matrix(1,2) = str2double(get(handles.edit_f1_s2,'String'));
end
if isempty(get(handles.edit_f2_s1,'String')) ~= 1
    Matrix(2,1) = str2double(get(handles.edit_f2_s1,'String'));
end
if isempty(get(handles.edit_f2_s2,'String')) ~= 1
    Matrix(2,2) = str2double(get(handles.edit_f2_s2,'String'));
end
if isempty(get(handles.edit_f3_s1,'String')) ~= 1
    Matrix(3,1) = str2double(get(handles.edit_f3_s1,'String'));
end
if isempty(get(handles.edit_f3_s2,'String')) ~= 1
    Matrix(3,2) = str2double(get(handles.edit_f3_s2,'String'));
end

% actuator
if isempty(get(handles.edit_f1_a1,'String')) ~= 1
    Matrix(1,3) = str2double(get(handles.edit_f1_a1,'String'));
end
if isempty(get(handles.edit_f1_a2,'String')) ~= 1
    Matrix(1,4) = str2double(get(handles.edit_f1_a2,'String'));
end
if isempty(get(handles.edit_f2_a1,'String')) ~= 1
    Matrix(2,3) = str2double(get(handles.edit_f2_a1,'String'));
end
if isempty(get(handles.edit_f2_a2,'String')) ~= 1
    Matrix(2,4) = str2double(get(handles.edit_f2_a2,'String'));
end
if isempty(get(handles.edit_f3_a1,'String')) ~= 1
    Matrix(3,3) = str2double(get(handles.edit_f3_a1,'String'));
end
if isempty(get(handles.edit_f3_a2,'String')) ~= 1
    Matrix(3,4) = str2double(get(handles.edit_f3_a2,'String'));
end

if sum(Matrix(:,1:4)) == 0
    errordlg('Please choose on which position occurs the fault.','Error');
else
    if sum(Matrix(:,5:6)) == 0
        errordlg('Please choose fault type.','Error');
    else
        load('customData.mat');
        load('fileData.mat');
        check_error = 0;
        input = reshape(Matrix(:,1:2),1,[]);
        output = reshape(Matrix(:,3:4),1,[]);
        if c_parameter.Choice(1,1)==1 
            % load
            if (max(input)>size(c_parameter.Process_model{2},2)) | (max(output)>size(c_parameter.Process_model{3},1))
                check_error = 1;
            end
        else 
            % generate
            if (max(input)> f_parameter.Sys_dim(2)) | (max(output)> f_parameter.Sys_dim(3))
                check_error = 1;
                
            end
        end
        
        if check_error == 1
            errordlg('Position does not match input/output.','Error');
        else
            f_parameter.Fault_position_mb = Matrix;
            save ('fileData','f_parameter');
            close;
            % calculating FD performance evaluation begin
            [~,FDR,MT2FD,FDR_p,MT2FD_p] = result_estimation(f_parameter,c_parameter);
            load('fileData.mat');
            f_parameter.Result = {FDR,MT2FD,FDR_p,MT2FD_p};
            save ('fileData','f_parameter');
            % calculating FD performance evaluation end
            Result_presentation;
        end
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


% --- Executes on button press in checkbox_f1ss.
function checkbox_f1ss_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f1ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f1ss
load('fileData.mat');
load('customData.mat');
if get(hObject,'Value')==1 
    set(handles.checkbox_f1ac,'Value',0);
    
    set(handles.checkbox_f1_s1,'Enable','On');
    set(handles.checkbox_f1_s2,'Enable','On');
    
    set(handles.checkbox_f1_a1,'Enable','Off');
    set(handles.checkbox_f1_a2,'Enable','Off');
    set(handles.checkbox_f1_a1,'Value',0);
    set(handles.checkbox_f1_a2,'Value',0);
    
    set(handles.edit_f1_a1,'Enable','Off');
    set(handles.edit_f1_a2,'Enable','Off');
    set(handles.edit_f1_a1,'String','');
    set(handles.edit_f1_a2,'String','');
else
    set(handles.checkbox_f1_s1,'Enable','Off');
    set(handles.checkbox_f1_s2,'Enable','Off');
    set(handles.checkbox_f1_s1,'Value',0);
    set(handles.checkbox_f1_s2,'Value',0);
end

% --- Executes on button press in checkbox_f1ac.
function checkbox_f1ac_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f1ac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f1ac
load('fileData.mat');
if get(hObject,'Value')==1
    set(handles.checkbox_f1ss,'Value',0);
    
    set(handles.checkbox_f1_a1,'Enable','On');
    set(handles.checkbox_f1_a2,'Enable','On');
    
    set(handles.checkbox_f1_s1,'Enable','Off');
    set(handles.checkbox_f1_s2,'Enable','Off');
    set(handles.checkbox_f1_s1,'Value',0);
    set(handles.checkbox_f1_s2,'Value',0);
    
    set(handles.edit_f1_s1,'Enable','Off');
    set(handles.edit_f1_s2,'Enable','Off');
    set(handles.edit_f1_s1,'String','');
    set(handles.edit_f1_s2,'String','');
else
    set(handles.checkbox_f1_a1,'Enable','Off');
    set(handles.checkbox_f1_a2,'Enable','Off');
    set(handles.checkbox_f1_a1,'Value',0);
    set(handles.checkbox_f1_a2,'Value',0);
end

% --- Executes on button press in checkbox_f1_s1.
function checkbox_f1_s1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f1_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f1_s1
if get(hObject,'Value')==1
    set(handles.edit_f1_s1,'Enable','On');
end

% --- Executes on button press in checkbox_f1_a1.
function checkbox_f1_a1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f1_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f1_a1
if get(hObject,'Value')==1
    set(handles.edit_f1_a1,'Enable','On');
end

% --- Executes on button press in checkbox_f1_s2.
function checkbox_f1_s2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f1_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f1_s2
if get(hObject,'Value')==1
    set(handles.edit_f1_s2,'Enable','On');
end

% --- Executes on button press in checkbox_f1_a2.
function checkbox_f1_a2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f1_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f1_a2
if get(hObject,'Value')==1
    set(handles.edit_f1_a2,'Enable','On');
end

% --- Executes on button press in checkbox_f2ss.
function checkbox_f2ss_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f2ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f2ss
load('fileData.mat');
if get(hObject,'Value')==1
    set(handles.checkbox_f2ac,'Value',0);
    
    set(handles.checkbox_f2_s1,'Enable','On');
    set(handles.checkbox_f2_s2,'Enable','On');
    
    set(handles.checkbox_f2_a1,'Enable','Off');
    set(handles.checkbox_f2_a2,'Enable','Off');
    set(handles.checkbox_f2_a1,'Value',0);
    set(handles.checkbox_f2_a2,'Value',0);
    
    set(handles.edit_f2_a1,'Enable','Off');
    set(handles.edit_f2_a2,'Enable','Off');
    set(handles.edit_f2_a1,'String','');
    set(handles.edit_f2_a2,'String','');
else
    set(handles.checkbox_f2_s1,'Enable','Off');
    set(handles.checkbox_f2_s2,'Enable','Off');
    set(handles.checkbox_f2_s1,'Value',0);
    set(handles.checkbox_f2_s2,'Value',0);
end

% --- Executes on button press in checkbox_f2ac.
function checkbox_f2ac_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f2ac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f2ac
load('fileData.mat');
if get(hObject,'Value')==1
    set(handles.checkbox_f2ss,'Value',0);
    
    set(handles.checkbox_f2_a1,'Enable','On');
    set(handles.checkbox_f2_a2,'Enable','On');
    
    set(handles.checkbox_f2_s1,'Enable','Off');
    set(handles.checkbox_f2_s2,'Enable','Off');
    set(handles.checkbox_f2_s1,'Value',0);
    set(handles.checkbox_f2_s2,'Value',0);
    
    set(handles.edit_f2_s1,'Enable','Off');
    set(handles.edit_f2_s2,'Enable','Off');
    set(handles.edit_f2_s1,'String','');
    set(handles.edit_f2_s2,'String','');
else
    set(handles.checkbox_f2_a1,'Enable','Off');
    set(handles.checkbox_f2_a2,'Enable','Off');
    set(handles.checkbox_f2_a1,'Value',0);
    set(handles.checkbox_f2_a2,'Value',0);
end

% --- Executes on button press in checkbox_f2_s1.
function checkbox_f2_s1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f2_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f2_s1
if get(hObject,'Value')==1
    set(handles.edit_f2_s1,'Enable','On');
end

% --- Executes on button press in checkbox_f2_a1.
function checkbox_f2_a1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f2_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f2_a1
if get(hObject,'Value')==1
    set(handles.edit_f2_a1,'Enable','On');
end

% --- Executes on button press in checkbox_f2_s2.
function checkbox_f2_s2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f2_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f2_s2
if get(hObject,'Value')==1
    set(handles.edit_f2_s2,'Enable','On');
end

% --- Executes on button press in checkbox_f2_a2.
function checkbox_f2_a2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f2_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f2_a2
if get(hObject,'Value')==1
    set(handles.edit_f2_a2,'Enable','On');
end

% --- Executes during object creation, after setting all properties.
function checkbox_f2ss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_f2ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >1
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function checkbox_f2ac_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_f2ac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >1
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes on button press in checkbox_f3ss.
function checkbox_f3ss_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f3ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f3ss
load('fileData.mat');
if get(hObject,'Value')==1
    set(handles.checkbox_f3ac,'Value',0);
    
    set(handles.checkbox_f3_s1,'Enable','On');
    set(handles.checkbox_f3_s2,'Enable','On');
    
    set(handles.checkbox_f3_a1,'Enable','Off');
    set(handles.checkbox_f3_a2,'Enable','Off');
    set(handles.checkbox_f3_a1,'Value',0);
    set(handles.checkbox_f3_a2,'Value',0);
    
    set(handles.edit_f3_a1,'Enable','Off');
    set(handles.edit_f3_a2,'Enable','Off');
    set(handles.edit_f3_a1,'String','');
    set(handles.edit_f3_a2,'String','');
else
    set(handles.checkbox_f3_s1,'Enable','Off');
    set(handles.checkbox_f3_s2,'Enable','Off');
    set(handles.checkbox_f3_s1,'Value',0);
    set(handles.checkbox_f3_s2,'Value',0);
end

% --- Executes on button press in checkbox_f3ac.
function checkbox_f3ac_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f3ac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f3ac
load('fileData.mat');
load('customData.mat');
if get(hObject,'Value')==1
    set(handles.checkbox_f3ss,'Value',0);    
    
    set(handles.checkbox_f3_a1,'Enable','On');
    set(handles.checkbox_f3_a2,'Enable','On');
    
    set(handles.checkbox_f3_s1,'Enable','Off');
    set(handles.checkbox_f3_s2,'Enable','Off');
    set(handles.checkbox_f3_s1,'Value',0);
    set(handles.checkbox_f3_s2,'Value',0);
    
    set(handles.edit_f3_s1,'Enable','Off');
    set(handles.edit_f3_s2,'Enable','Off');
    set(handles.edit_f3_s1,'String','');
    set(handles.edit_f3_s2,'String','');
else
    set(handles.checkbox_f3_a1,'Enable','Off');
    set(handles.checkbox_f3_a2,'Enable','Off');
    set(handles.checkbox_f3_a1,'Value',0);
    set(handles.checkbox_f3_a2,'Value',0);
end

% --- Executes on button press in checkbox_f3_s1.
function checkbox_f3_s1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f3_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f3_s1
if get(hObject,'Value')==1
    set(handles.edit_f3_s1,'Enable','On');
end

% --- Executes on button press in checkbox_f3_a1.
function checkbox_f3_a1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f3_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f3_a1
if get(hObject,'Value')==1
    set(handles.edit_f3_a1,'Enable','On');
end

% --- Executes on button press in checkbox_f3_s2.
function checkbox_f3_s2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f3_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f3_s2
if get(hObject,'Value')==1
    set(handles.edit_f3_s2,'Enable','On');
end

% --- Executes on button press in checkbox_f3_a2.
function checkbox_f3_a2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_f3_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_f3_a2
if get(hObject,'Value')==1
    set(handles.edit_f3_a2,'Enable','On');
end

% --- Executes during object creation, after setting all properties.
function checkbox_f3ss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_f3ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >2
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function checkbox_f3ac_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_f3ac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Fault_Number
if Fault_Number >2
    set(hObject,'Enable','On');
else
    set(hObject,'Enable','Off');
end



function edit_f1_s1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f1_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f1_s1 as text
%        str2double(get(hObject,'String')) returns contents of edit_f1_s1 as a double


% --- Executes during object creation, after setting all properties.
function edit_f1_s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f1_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f1_s2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f1_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f1_s2 as text
%        str2double(get(hObject,'String')) returns contents of edit_f1_s2 as a double


% --- Executes during object creation, after setting all properties.
function edit_f1_s2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f1_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f1_a1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f1_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f1_a1 as text
%        str2double(get(hObject,'String')) returns contents of edit_f1_a1 as a double


% --- Executes during object creation, after setting all properties.
function edit_f1_a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f1_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f1_a2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f1_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f1_a2 as text
%        str2double(get(hObject,'String')) returns contents of edit_f1_a2 as a double


% --- Executes during object creation, after setting all properties.
function edit_f1_a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f1_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f2_s1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f2_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f2_s1 as text
%        str2double(get(hObject,'String')) returns contents of edit_f2_s1 as a double


% --- Executes during object creation, after setting all properties.
function edit_f2_s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f2_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f2_s2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f2_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f2_s2 as text
%        str2double(get(hObject,'String')) returns contents of edit_f2_s2 as a double


% --- Executes during object creation, after setting all properties.
function edit_f2_s2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f2_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f3_s1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f3_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f3_s1 as text
%        str2double(get(hObject,'String')) returns contents of edit_f3_s1 as a double


% --- Executes during object creation, after setting all properties.
function edit_f3_s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f3_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f3_s2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f3_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f3_s2 as text
%        str2double(get(hObject,'String')) returns contents of edit_f3_s2 as a double


% --- Executes during object creation, after setting all properties.
function edit_f3_s2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f3_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f2_a1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f2_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f2_a1 as text
%        str2double(get(hObject,'String')) returns contents of edit_f2_a1 as a double


% --- Executes during object creation, after setting all properties.
function edit_f2_a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f2_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f2_a2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f2_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f2_a2 as text
%        str2double(get(hObject,'String')) returns contents of edit_f2_a2 as a double


% --- Executes during object creation, after setting all properties.
function edit_f2_a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f2_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f3_a1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f3_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f3_a1 as text
%        str2double(get(hObject,'String')) returns contents of edit_f3_a1 as a double


% --- Executes during object creation, after setting all properties.
function edit_f3_a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f3_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f3_a2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f3_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f3_a2 as text
%        str2double(get(hObject,'String')) returns contents of edit_f3_a2 as a double


% --- Executes during object creation, after setting all properties.
function edit_f3_a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f3_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
