function varargout = Method_selection(varargin)
% METHOD_SELECTION MATLAB code for Method_selection.fig
%      METHOD_SELECTION, by itself, creates a new METHOD_SELECTION or raises the existing
%      singleton*.
%
%      H = METHOD_SELECTION returns the handle to a new METHOD_SELECTION or the handle to
%      the existing singleton*.
%
%      METHOD_SELECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METHOD_SELECTION.M with the given input arguments.
%
%      METHOD_SELECTION('Property','Value',...) creates a new METHOD_SELECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Method_selection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Method_selection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Method_selection

% Last Modified by GUIDE v2.5 23-Feb-2017 20:51:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Method_selection_OpeningFcn, ...
                   'gui_OutputFcn',  @Method_selection_OutputFcn, ...
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


% --- Executes just before Method_selection is made visible.
function Method_selection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Method_selection (see VARARGIN)

% Choose default command line output for Method_selection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Method_selection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Method_selection_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Detection_method = [get(handles.checkbox_m1,'Value') get(handles.checkbox_m2,'Value') get(handles.checkbox_m3,'Value') get(handles.checkbox_m4,'Value')];
Estimation_method = [get(handles.checkbox_far,'Value') get(handles.checkbox_fd,'Value')];
load('fileData.mat');
f_parameter.Detection_method = Detection_method;
f_parameter.Estimation_method= Estimation_method;
save ('fileData','f_parameter');
load('customData.mat');
if Estimation_method == [0 0]
    errordlg('Please choose estimation method.','Error');
elseif Estimation_method(2) ==1 && (isfield(f_parameter,'Fault_range') | isfield(c_parameter,'Fault_range')) == 0
    errordlg('Have not set fault parameters yet. Please go up step. ','Error');
else
    [FAR,FDR,MT2FD,FDR_p,MT2FD_p] = result_estimation(f_parameter,c_parameter);
    f_parameter.Result = {FAR,FDR,MT2FD,FDR_p,MT2FD_p};
    save('fileData','f_parameter');
    close;
    if Estimation_method == [1 0]
        Result_FAR;
    elseif Estimation_method == [1 1]
       Result_presentation; 
       Result_FAR;
    elseif Estimation_method == [0 0]
    Result_presentation;
    
    end
end
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_type;
close;
Data_type_generating;


% --- Executes on button press in checkbox_m1.
function checkbox_m1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_m1


% --- Executes on button press in checkbox_m2.
function checkbox_m2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_m2


% --- Executes on button press in checkbox_m4.
function checkbox_m4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_m4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_m4
if get(hObject,'Value')==1
    set(handles.edit_cuspath,'Enable','On');
    set(handles.pushbutton_cusmethod,'Enable','On');
else
   set(handles.edit_cuspath,'Enable','Off');
    set(handles.pushbutton_cusmethod,'Enable','Off'); 
end


function edit_cuspath_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cuspath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cuspath as text
%        str2double(get(hObject,'String')) returns contents of edit_cuspath as a double


% --- Executes during object creation, after setting all properties.
function edit_cuspath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cuspath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_cusmethod.
function pushbutton_cusmethod_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cusmethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% handles=guihandles;
% 
% global Custom_Method_Path Custom_Method_Name;
% [FileName,PathName,FilterIndex] = uigetfile('*.m');
% 
% if( FileName ~= 0 )
%     Custom_Method_Path = strcat(PathName,FileName);
%     Custom_Method_Name = FileName;
% end
% 
% 
% warn_1 = 'Please import an Valid File';
% if( FileName == 0 )
%     set(handles.edit_cuspath,'String',warn_1);  
% else  
%     set(handles.edit_cuspath,'String',FileName);
% end


% --- Executes on button press in checkbox_cca.
function checkbox_cca_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_cca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_cca


% --- Executes on button press in checkbox_pls.
function checkbox_pls_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_pls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_pls


% --- Executes on button press in checkbox_m3.
function checkbox_m3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_m3


% --- Executes during object creation, after setting all properties.
function checkbox_cca_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_cca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
switch Data_type
    case 1 
        set(hObject,'Visible','Off');
    case 2
        set(hObject,'Visible','On');
    case 3
        set(hObject,'Visible','On');
        set(hObject,'Position',[14 27.286 19.6 1.857]);
end


% --- Executes during object creation, after setting all properties.
function checkbox_m1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
switch Data_type
    case 1 
        set(hObject,'String','   GLR');
    case 2
        set(hObject,'String','   PLS');
    case 3
        set(hObject,'String','   CCA');
end


% --- Executes during object creation, after setting all properties.
function checkbox_m2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
switch Data_type
    case 1 
        set(hObject,'String','   PCA');
        set(hObject,'Position',[14.200000000000001 24.357142857142854 19.6 1.8571428571428577]);
    case 2
        set(hObject,'String','   CCA');
        set(hObject,'Position',[14.200000000000001 24.357142857142854 19.6 1.8571428571428577]);
    case 3
        set(hObject,'String','   dynamic PCA');
        set(hObject,'Position',[14.200000000000001 24.357142857142854 26.6 1.8571428571428577]);
end


% --- Executes during object creation, after setting all properties.
function checkbox_pls_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_pls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
switch Data_type
    case 1 
        set(hObject,'Visible','Off');
    case 2
        set(hObject,'Visible','On');
        set(hObject,'Position',[14 27.286 19.6 1.857]);
end


% --- Executes during object creation, after setting all properties.
function checkbox_m3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
switch Data_type
    case 1 
        set(hObject,'Visible','Off');
    case 2
        set(hObject,'Visible','On');
    case 3 
        set(hObject,'Visible','Off');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox_far.
function checkbox_far_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_far (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_far
global Data
if get(hObject,'Value')==1
    switch Data
        case 1
          FAR;
        case 2
          FAR_data;
    end
handles=guihandles;
end
% --- Executes on button press in checkbox_fd.
function checkbox_fd_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_fd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_fd


% --- Executes on button press in checkbox_dpca.
function checkbox_dpca_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_dpca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_dpca


% --- Executes during object creation, after setting all properties.
function checkbox_dpca_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_dpca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
switch Data_type
    case 1 
        set(hObject,'Visible','Off');
    case 2
        set(hObject,'Visible','Off');
    case 3
        set(hObject,'Visible','On');
        set(hObject,'Position',[14 24.357 26.6 1.857]);
end
