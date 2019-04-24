function varargout = FAR(varargin)
% FAR MATLAB code for FAR.fig
%      FAR, by itself, creates a new FAR or raises the existing
%      singleton*.
%
%      H = FAR returns the handle to a new FAR or the handle to
%      the existing singleton*.
%
%      FAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAR.M with the given input arguments.
%
%      FAR('Property','Value',...) creates a new FAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FAR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FAR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FAR

% Last Modified by GUIDE v2.5 17-May-2017 13:41:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FAR_OpeningFcn, ...
                   'gui_OutputFcn',  @FAR_OutputFcn, ...
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


% --- Executes just before FAR is made visible.
function FAR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FAR (see VARARGIN)

% Choose default command line output for FAR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FAR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FAR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_far_Callback(hObject, eventdata, handles)
% hObject    handle to edit_far (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_far as text
%        str2double(get(hObject,'String')) returns contents of edit_far as a double


% --- Executes during object creation, after setting all properties.
function edit_far_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_far (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_threshold_Callback(hObject, eventdata, handles)
% hObject    handle to edit_threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_threshold as text
%        str2double(get(hObject,'String')) returns contents of edit_threshold as a double


% --- Executes during object creation, after setting all properties.
function edit_threshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton_cal.
function radiobutton_cal_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_cal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_cal
if get(hObject,'Value')==1
set(handles.radiobutton_cus,'Value',0);
set(handles.edit_threshold,'enable','Off');
set(handles.edit_threshold,'String','');
end


% --- Executes on button press in radiobutton_cus.
function radiobutton_cus_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_cus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_cus
if get(hObject,'Value')==1
   set(handles.radiobutton_cal,'Value',0);
   set(handles.edit_threshold,'enable','On');
else
   set(handles.edit_threshold,'string',''); 
   set(handles.edit_threshold,'enable','Off');
end


% --- Executes on button press in checkbox_dis.
function checkbox_dis_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_dis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_dis
handles=guihandles;
if (get(handles.checkbox_dis,'Value'))==1
set(handles.edit_pr_dis,'enable','on');
else
    set(handles.edit_pr_dis,'string','');
    set(handles.edit_pr_dis,'enable','off');
end



function edit_pr_dis_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_dis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_dis as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_dis as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_dis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_dis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_unc.
function checkbox_unc_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_unc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_unc
handles=guihandles;
if (get(handles.checkbox_unc,'Value'))==1
set(handles.edit_pr_unc,'enable','on');
else
    set(handles.edit_pr_unc,'string','');
    set(handles.edit_pr_unc,'enable','off');
end



function edit_pr_unc_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_unc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_unc as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_unc as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_unc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_unc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_both.
function checkbox_both_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_both (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_both
handles=guihandles;
if (get(handles.checkbox_both,'Value'))==1
set(handles.edit_pr_both,'enable','on');
else
    set(handles.edit_pr_both,'string','');
    set(handles.edit_pr_both,'enable','off');
end



function edit_pr_both_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_both (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_both as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_both as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_both_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_both (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_close.
function pushbutton_close_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
    close all;
end

% --- Executes on button press in pushbutton_ok.
function pushbutton_ok_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
check_dis = get(handles.checkbox_dis,'Value');
check_unc = get(handles.checkbox_unc,'Value');
check_both = get(handles.checkbox_both,'Value');
pr1 = get(handles.edit_pr_dis,'String');
pr2 = get(handles.edit_pr_unc,'String');
pr3 = get(handles.edit_pr_both,'String');

if isempty(get(handles.edit_threshold,'String'))
    errordlg('Please set threshold.','Error');
else
    threshold = str2double(get(handles.edit_threshold,'String'));
        if (check_dis+check_unc+check_both) ==0
            errordlg('Please choose normal operating type(s).','Error');
        else
            operating_type = [check_dis;check_unc;check_both]; %operating type
            operating_pr = [0;0;0];
            if check_dis==1
                operating_pr(1,1) = str2double(pr1);
            end
            
            if check_unc==1
                operating_pr(2,1) = str2double(pr2);
            end
            
            if check_both==1
                operating_pr(3,1) = str2double(pr3);
            end
            
            if sum(operating_pr)~=100
                errordlg('The sum of all probabilities should be 100%.','Error');
            else
                load('fileData.mat');
                f_parameter.FAR_estimation = {threshold [operating_type operating_pr]}; % save all data to matrix 'Far_estimation'
                save ('fileData','f_parameter');
                close;
                % calculating FAR begin
                load('fileData.mat');
                load('customData.mat');
                [FAR,Jth,far,J_th] = MBFAR_estimation(f_parameter,c_parameter);
                f_parameter.Result_mbFAR = {FAR,Jth,far,J_th};
                save ('fileData','f_parameter');
                % calculating FAR end
                Result_FAR_mb;
            end                        
        end
end


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Selections;
