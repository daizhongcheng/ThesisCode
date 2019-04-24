function varargout = Input_data(varargin)
% INPUT_DATA MATLAB code for Input_data.fig
%      INPUT_DATA, by itself, creates a new INPUT_DATA or raises the existing
%      singleton*.
%
%      H = INPUT_DATA returns the handle to a new INPUT_DATA or the handle to
%      the existing singleton*.
%
%      INPUT_DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INPUT_DATA.M with the given input arguments.
%
%      INPUT_DATA('Property','Value',...) creates a new INPUT_DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Input_data_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Input_data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Input_data

% Last Modified by GUIDE v2.5 07-Jun-2017 14:33:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Input_data_OpeningFcn, ...
                   'gui_OutputFcn',  @Input_data_OutputFcn, ...
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


% --- Executes just before Input_data is made visible.
function Input_data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Input_data (see VARARGIN)

% Choose default command line output for Input_data
handles.output = hObject;

% Update handles structure
ha=axes('units','characters','position',[9.8 5 70.7 21]);
II=imread('Input Signal.jpg');
image(II)
colormap gray
set(ha,'visible','off');

guidata(hObject, handles);

% UIWAIT makes Input_data wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Input_data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox_load.
function checkbox_load_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_load
if (get(hObject,'Value'))==1
    set(handles.checkbox_generate,'Value',0);
    set(handles.edit_siglen,'enable','off');
    set(handles.edit_11,'enable','off');
    set(handles.edit_12,'enable','off');
    set(handles.edit_13,'enable','off');
    set(handles.edit_14,'enable','off');
    set(handles.edit_21,'enable','off');
    set(handles.edit_22,'enable','off');
    set(handles.edit_23,'enable','off');
    set(handles.edit_24,'enable','off');
    set(handles.edit_31,'enable','off');
    set(handles.edit_32,'enable','off');
    set(handles.edit_33,'enable','off');
    set(handles.edit_34,'enable','off');
    
    [filename,pathname]=uigetfile(['*.mat'],'Please choose file.');
    str=[pathname,filename];
    if ((filename==0) & (pathname==0))
        msgbox('You have not chosen any file.','Error open file','error');
    else
        load('fileData.mat');
        load('customData.mat');
        data=load (strcat([pathname filename]));
        check = 0;
        if isfield(data,'Input_signal')
            % check input signal (row/col)
             if size(data.Input_signal,1)> size(data.Input_signal,2)
                 size_in = size(data.Input_signal,2);
             else
                 size_in = size(data.Input_signal,1);
             end
             % if the custom use GUI to generate system model
             if c_parameter.Choice(1,2)==1 
                if f_parameter.Sys_dim(2) ~= size_in
                   check =1;
                else
                   c_parameter.Input_signal = data.Input_signal;
                end
                % if the custom load system model    
             elseif c_parameter.Choice(1,1)==1
                if size(c_parameter.Process_model{2},2) ~= size_in
                   check =1;
                else
                   c_parameter.Input_signal = data.Input_signal;
                end
             end
        else
            check = 2;
        end
        if check == 1
            errordlg('Please check the dimension of input signal.','Error');
            set(handles.checkbox_load,'Value',0);
        elseif check == 2
            errordlg('Input signal is missing.','Error');
            set(handles.checkbox_load,'Value',0);
        elseif check == 0
            save ('customData','c_parameter');
        end
    end
end

% --- Executes on button press in checkbox_generate.
function checkbox_generate_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles=guihandles;
if (get(hObject,'Value'))==1
set(handles.checkbox_load,'Value',0);
set(handles.edit_siglen,'enable','on');
set(handles.edit_11,'String',num2str(1));
set(handles.edit_11,'enable','on');
set(handles.edit_12,'enable','on');
set(handles.edit_13,'enable','on');
set(handles.edit_14,'enable','on');
set(handles.edit_21,'enable','on');
set(handles.edit_22,'enable','on');
set(handles.edit_23,'enable','on');
set(handles.edit_24,'enable','on');
set(handles.edit_31,'enable','on');
set(handles.edit_32,'enable','on');
set(handles.edit_33,'enable','on');
set(handles.edit_34,'enable','on');
else 
set(handles.edit_siglen,'enable','off');
set(handles.edit_11,'String','');
set(handles.edit_11,'enable','off');
set(handles.edit_12,'enable','off');
set(handles.edit_13,'enable','off');
set(handles.edit_14,'enable','off');
set(handles.edit_21,'enable','off');
set(handles.edit_22,'enable','off');
set(handles.edit_23,'enable','off');
set(handles.edit_24,'enable','off');
set(handles.edit_31,'enable','off');
set(handles.edit_32,'enable','off');
set(handles.edit_33,'enable','off');
set(handles.edit_34,'enable','off');
end
% Hint: get(hObject,'Value') returns toggle state of checkbox_generate


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
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
if get(handles.checkbox_load,'Value')==1
    load('customData.mat');
    c_parameter.Choice(2,1:3) = [get(handles.checkbox_load,'Value') 0 get(handles.checkbox_generate,'Value')];
    save ('customData','c_parameter');
    close;
elseif get(handles.checkbox_generate,'Value')==1
    checking = 0;
    % check signal length existance
    if isempty(get(handles.edit_siglen,'String'))
        checking =1;
    else
        v_siglen = str2double(get(handles.edit_siglen,'String'));
    end
    % check duration 1 existance
    if isempty(get(handles.edit_11,'String'))
        checking =1;
    else
        v_11 = str2double(get(handles.edit_11,'String'));
    end
    if isempty(get(handles.edit_12,'String'))
        checking =1;
    else
        v_12 = str2double(get(handles.edit_12,'String'));
    end
    if isempty(get(handles.edit_13,'String'))
        checking =1;
    else
        v_13 = str2double(get(handles.edit_13,'String'));
    end
    if isempty(get(handles.edit_14,'String'))
        checking =1;
    else
        v_14 = str2double(get(handles.edit_14,'String'));
    end
    % check duration 2 existance
    if isempty(get(handles.edit_21,'String'))
        checking =1;
    else
        v_21 = str2double(get(handles.edit_21,'String'));
    end
    if isempty(get(handles.edit_22,'String'))
        checking =1;
    else
        v_22 = str2double(get(handles.edit_22,'String'));
    end
    if isempty(get(handles.edit_23,'String'))
        checking =1;
    else
        v_23 = str2double(get(handles.edit_23,'String'));
    end
    if isempty(get(handles.edit_24,'String'))
        checking =1;
    else
        v_24 = str2double(get(handles.edit_24,'String'));
    end
    % check duration 3 existance
    if isempty(get(handles.edit_31,'String'))
        checking =1;
    else
        v_31 = str2double(get(handles.edit_31,'String'));
    end
    if isempty(get(handles.edit_32,'String'))
        checking =1;
    else
        v_32 = str2double(get(handles.edit_32,'String'));
    end
    if isempty(get(handles.edit_33,'String'))
        checking =1;
    else
        v_33 = str2double(get(handles.edit_33,'String'));
    end
    if isempty(get(handles.edit_34,'String'))
        checking =1;
    else
        v_34 = str2double(get(handles.edit_34,'String'));
    end
    if checking == 1
        errordlg('Please complete information about input signal.','Error');
    else
        if v_32 ~= v_siglen
            errordlg('Signal length does not match durations.','Error');
        else
            load('fileData.mat');
            f_parameter.Input_data = {v_siglen [v_11 v_12 v_13 v_14;v_21 v_22 v_23 v_24;v_31 v_32 v_33 v_34]};
            save ('fileData','f_parameter');
            load('customData.mat');
            c_parameter.Choice(2,1:3) = [get(handles.checkbox_load,'Value') 0 get(handles.checkbox_generate,'Value')];
            save ('customData','c_parameter');
            close;
        end
    end
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Residual;

% --- Executes during object creation, after setting all properties.



function edit_13_Callback(hObject, eventdata, handles)
% hObject    handle to edit_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_13 as text
%        str2double(get(hObject,'String')) returns contents of edit_13 as a double


% --- Executes during object creation, after setting all properties.
function edit_13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_14_Callback(hObject, eventdata, handles)
% hObject    handle to edit_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_14 as text
%        str2double(get(hObject,'String')) returns contents of edit_14 as a double


% --- Executes during object creation, after setting all properties.
function edit_14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_siglen_Callback(hObject, eventdata, handles)
% hObject    handle to edit_siglen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_siglen as text
%        str2double(get(hObject,'String')) returns contents of edit_siglen as a double


% --- Executes during object creation, after setting all properties.
function edit_siglen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_siglen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
x=linspace(0,6);
y=5*(x<=1)+0*(1<x&x<=2)+7*(2<x&x<=3)+4*(3<x&x<=4)+8*(4<x&x<=5)+0*(5<x&x<=6)+3*(6<x&x<=7)+5*(7<x&x<=8);
plot(x,y);
title('Input signal');
xlabel('Sample');


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
x=linspace(0,6);
y=5*(x<=1)+0*(1<x&x<=2)+7*(2<x&x<=3)+4*(3<x&x<=4)+8*(4<x&x<=5)+0*(5<x&x<=6)+3*(6<x&x<=7)+5*(7<x&x<=8);
plot(x,y);
title('Input signal');
xlabel('Sample');


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4
x=linspace(0,6);
y=5*(x<=1)+0*(1<x&x<=2)+7*(2<x&x<=3)+4*(3<x&x<=4)+8*(4<x&x<=5)+0*(5<x&x<=6)+3*(6<x&x<=7)+5*(7<x&x<=8);
plot(x,y);
title('Input signal');
xlabel('Sample');


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5



% --- Executes during object creation, after setting all properties.
function axes_img_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_22 as text
%        str2double(get(hObject,'String')) returns contents of edit_22 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_33 as text
%        str2double(get(hObject,'String')) returns contents of edit_33 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_23_Callback(hObject, eventdata, handles)
% hObject    handle to edit_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_23 as text
%        str2double(get(hObject,'String')) returns contents of edit_23 as a double


% --- Executes during object creation, after setting all properties.
function edit_23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_24_Callback(hObject, eventdata, handles)
% hObject    handle to edit_24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_24 as text
%        str2double(get(hObject,'String')) returns contents of edit_24 as a double


% --- Executes during object creation, after setting all properties.
function edit_24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_21_Callback(hObject, eventdata, handles)
% hObject    handle to edit_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_21 as text
%        str2double(get(hObject,'String')) returns contents of edit_21 as a double


% --- Executes during object creation, after setting all properties.
function edit_21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_22_Callback(hObject, eventdata, handles)
% hObject    handle to edit_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_22 as text
%        str2double(get(hObject,'String')) returns contents of edit_22 as a double


% --- Executes during object creation, after setting all properties.
function edit_22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_33_Callback(hObject, eventdata, handles)
% hObject    handle to edit_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_33 as text
%        str2double(get(hObject,'String')) returns contents of edit_33 as a double


% --- Executes during object creation, after setting all properties.
function edit_33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_34_Callback(hObject, eventdata, handles)
% hObject    handle to edit_34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_34 as text
%        str2double(get(hObject,'String')) returns contents of edit_34 as a double


% --- Executes during object creation, after setting all properties.
function edit_34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_31_Callback(hObject, eventdata, handles)
% hObject    handle to edit_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_31 as text
%        str2double(get(hObject,'String')) returns contents of edit_31 as a double


% --- Executes during object creation, after setting all properties.
function edit_31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_32_Callback(hObject, eventdata, handles)
% hObject    handle to edit_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_32 as text
%        str2double(get(hObject,'String')) returns contents of edit_32 as a double


% --- Executes during object creation, after setting all properties.
function edit_32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_11_Callback(hObject, eventdata, handles)
% hObject    handle to edit_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_11 as text
%        str2double(get(hObject,'String')) returns contents of edit_11 as a double



function edit_12_Callback(hObject, eventdata, handles)
% hObject    handle to edit_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_12 as text
%        str2double(get(hObject,'String')) returns contents of edit_12 as a double


% --- Executes during object creation, after setting all properties.
function edit_12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on button press in checkbox_disturb.
function checkbox_disturb_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_disturb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_disturb
if get(hObject,'Value')==1
    [filename,pathname]=uigetfile(['*.mat'],'Please choose file.');
    str=[pathname,filename];
    if ((filename==0) & (pathname==0))
        msgbox('You have not chosen any file.','Error open file','error');
    else
        data=load (strcat([pathname filename]));
        load('customData.mat');
        c_parameter.Disturbance = data.Disturbance;
        save ('customData','c_parameter'); 
    end
end
