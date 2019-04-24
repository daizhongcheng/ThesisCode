function varargout = Para_matrix(varargin)
% PARA_MATRIX MATLAB code for Para_matrix.fig
%      PARA_MATRIX, by itself, creates a new PARA_MATRIX or raises the existing
%      singleton*.
%
%      H = PARA_MATRIX returns the handle to a new PARA_MATRIX or the handle to
%      the existing singleton*.
%
%      PARA_MATRIX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARA_MATRIX.M with the given input arguments.
%
%      PARA_MATRIX('Property','Value',...) creates a new PARA_MATRIX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Para_matrix_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Para_matrix_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Para_matrix

% Last Modified by GUIDE v2.5 10-May-2017 15:17:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Para_matrix_OpeningFcn, ...
                   'gui_OutputFcn',  @Para_matrix_OutputFcn, ...
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


% --- Executes just before Para_matrix is made visible.
function Para_matrix_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Para_matrix (see VARARGIN)

% Choose default command line output for Para_matrix
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Para_matrix wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Para_matrix_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit91_Callback(hObject, eventdata, handles)
% hObject    handle to edit91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit91 as text
%        str2double(get(hObject,'String')) returns contents of edit91 as a double


% --- Executes during object creation, after setting all properties.
function edit91_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit72_Callback(hObject, eventdata, handles)
% hObject    handle to edit72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit72 as text
%        str2double(get(hObject,'String')) returns contents of edit72 as a double


% --- Executes during object creation, after setting all properties.
function edit72_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit82_Callback(hObject, eventdata, handles)
% hObject    handle to edit82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit82 as text
%        str2double(get(hObject,'String')) returns contents of edit82 as a double


% --- Executes during object creation, after setting all properties.
function edit82_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Para_mat
Matrix = zeros(3,6);
if isempty(get(handles.edit11,'String')) ~= 1
    Matrix(1,1) = str2double(get(handles.edit11,'String'));
end
if isempty(get(handles.edit12,'String')) ~= 1
    Matrix(1,2) = str2double(get(handles.edit12,'String'));
end
if isempty(get(handles.edit13,'String')) ~= 1
    Matrix(1,3) = str2double(get(handles.edit13,'String'));
end
if isempty(get(handles.edit14,'String')) ~= 1
    Matrix(1,4) = str2double(get(handles.edit14,'String'));
end
if isempty(get(handles.edit15,'String')) ~= 1
    Matrix(1,5) = str2double(get(handles.edit15,'String'));
end
if isempty(get(handles.edit16,'String')) ~= 1
    Matrix(1,6) = str2double(get(handles.edit16,'String'));
end
if isempty(get(handles.edit21,'String')) ~= 1
    Matrix(2,1) = str2double(get(handles.edit21,'String'));
end
if isempty(get(handles.edit22,'String')) ~= 1
    Matrix(2,2) = str2double(get(handles.edit22,'String'));
end
if isempty(get(handles.edit23,'String')) ~= 1
    Matrix(2,3) = str2double(get(handles.edit23,'String'));
end
if isempty(get(handles.edit24,'String')) ~= 1
    Matrix(2,4) = str2double(get(handles.edit24,'String'));
end
if isempty(get(handles.edit25,'String')) ~= 1
    Matrix(2,5) = str2double(get(handles.edit25,'String'));
end
if isempty(get(handles.edit26,'String')) ~= 1
    Matrix(2,6) = str2double(get(handles.edit26,'String'));
end
if isempty(get(handles.edit31,'String')) ~= 1
    Matrix(3,1) = str2double(get(handles.edit31,'String'));
end
if isempty(get(handles.edit32,'String')) ~= 1
    Matrix(3,2) = str2double(get(handles.edit32,'String'));
end
if isempty(get(handles.edit33,'String')) ~= 1
    Matrix(3,3) = str2double(get(handles.edit33,'String'));
end
if isempty(get(handles.edit34,'String')) ~= 1
    Matrix(3,4) = str2double(get(handles.edit34,'String'));
end
if isempty(get(handles.edit35,'String')) ~= 1
    Matrix(3,5) = str2double(get(handles.edit35,'String'));
end
if isempty(get(handles.edit36,'String')) ~= 1
    Matrix(3,6) = str2double(get(handles.edit36,'String'));
end
dist = [get(handles.radio_u,'Value') get(handles.radio_n,'Value')];
if sum(dist) == 0
    errordlg('Please choose distribution type .','Error');
else
    if dist(1) == 1
        dist = 1;
    else
        dist = 2;
    end
load('fileData.mat');
switch Para_mat
    case 1
        f_parameter.Uncertainty{3} = Matrix; 
        f_parameter.Uncertainty{2}(1) = dist;
    case 2
        f_parameter.Uncertainty{4} = Matrix; 
        f_parameter.Uncertainty{2}(2) = dist;
    case 3
        f_parameter.Uncertainty{5} = Matrix; 
        f_parameter.Uncertainty{2}(3) = dist;
    case 4
        f_parameter.Uncertainty{6} = Matrix; 
        f_parameter.Uncertainty{2}(4) = dist;
    case 5
        f_parameter.Uncertainty{7} = Matrix; 
        f_parameter.Uncertainty{2}(5) = dist;
    case 6
        f_parameter.Uncertainty{8} = Matrix; 
        f_parameter.Uncertainty{2}(6) = dist;
end
save ('fileData','f_parameter');        
close(gcf);
handles=guihandles;
switch Para_mat
    case 1
        set(handles.text_A,'Visible','On');    
    case 2
        set(handles.text_B,'Visible','On');  
    case 3
        set(handles.text_C,'Visible','On'); 
    case 4
        set(handles.text_D,'Visible','On'); 
    case 5
        set(handles.text_E,'Visible','On'); 
    case 6
        set(handles.text_F,'Visible','On');  
end
end
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit34_Callback(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit34 as text
%        str2double(get(hObject,'String')) returns contents of edit34 as a double


% --- Executes during object creation, after setting all properties.
function edit34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit35 as text
%        str2double(get(hObject,'String')) returns contents of edit35 as a double


% --- Executes during object creation, after setting all properties.
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit36_Callback(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit36 as text
%        str2double(get(hObject,'String')) returns contents of edit36 as a double


% --- Executes during object creation, after setting all properties.
function edit36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit71_Callback(hObject, eventdata, handles)
% hObject    handle to edit71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit71 as text
%        str2double(get(hObject,'String')) returns contents of edit71 as a double


% --- Executes during object creation, after setting all properties.
function edit71_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit81_Callback(hObject, eventdata, handles)
% hObject    handle to edit81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit81 as text
%        str2double(get(hObject,'String')) returns contents of edit81 as a double


% --- Executes during object creation, after setting all properties.
function edit81_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit92_Callback(hObject, eventdata, handles)
% hObject    handle to edit92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit92 as text
%        str2double(get(hObject,'String')) returns contents of edit92 as a double


% --- Executes during object creation, after setting all properties.
function edit92_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit73_Callback(hObject, eventdata, handles)
% hObject    handle to edit73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit73 as text
%        str2double(get(hObject,'String')) returns contents of edit73 as a double


% --- Executes during object creation, after setting all properties.
function edit73_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit83_Callback(hObject, eventdata, handles)
% hObject    handle to edit83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit83 as text
%        str2double(get(hObject,'String')) returns contents of edit83 as a double


% --- Executes during object creation, after setting all properties.
function edit83_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit93_Callback(hObject, eventdata, handles)
% hObject    handle to edit93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit93 as text
%        str2double(get(hObject,'String')) returns contents of edit93 as a double


% --- Executes during object creation, after setting all properties.
function edit93_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radio_u.
function radio_u_Callback(hObject, eventdata, handles)
% hObject    handle to radio_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_u
global Para_mat
set(handles.radio_n,'Value',0);
switch Para_mat
    case 1
set(handles.text11,'String','A11  ~ U [                ,                 ]');
set(handles.text12,'String','A12  ~ U [                ,                 ]');
set(handles.text13,'String','A13  ~ U [                ,                 ]');
set(handles.text21,'String','A21  ~ U [                ,                 ]');
set(handles.text22,'String','A22  ~ U [                ,                 ]');
set(handles.text23,'String','A23  ~ U [                ,                 ]');
set(handles.text31,'String','A31  ~ U [                ,                 ]');
set(handles.text32,'String','A32  ~ U [                ,                 ]');
set(handles.text33,'String','A33  ~ U [                ,                 ]');

    case 2
set(handles.text11,'String','B11  ~ U [                ,                 ]');
set(handles.text12,'String','B12  ~ U [                ,                 ]');
set(handles.text13,'String','B13  ~ U [                ,                 ]');
set(handles.text21,'String','B21  ~ U [                ,                 ]');
set(handles.text22,'String','B22  ~ U [                ,                 ]');
set(handles.text23,'String','B23  ~ U [                ,                 ]');
set(handles.text31,'String','B31  ~ U [                ,                 ]');
set(handles.text32,'String','B32  ~ U [                ,                 ]');
set(handles.text33,'String','B33  ~ U [                ,                 ]');

    case 3
set(handles.text11,'String','C11  ~ U [                ,                 ]');
set(handles.text12,'String','C12  ~ U [                ,                 ]');
set(handles.text13,'String','C13  ~ U [                ,                 ]');
set(handles.text21,'String','C21  ~ U [                ,                 ]');
set(handles.text22,'String','C22  ~ U [                ,                 ]');
set(handles.text23,'String','C23  ~ U [                ,                 ]');
set(handles.text31,'String','C31  ~ U [                ,                 ]');
set(handles.text32,'String','C32  ~ U [                ,                 ]');
set(handles.text33,'String','C33  ~ U [                ,                 ]');

    case 4
set(handles.text11,'String','D11  ~ U [                ,                 ]');
set(handles.text12,'String','D12  ~ U [                ,                 ]');
set(handles.text13,'String','D13  ~ U [                ,                 ]');
set(handles.text21,'String','D21  ~ U [                ,                 ]');
set(handles.text22,'String','D22  ~ U [                ,                 ]');
set(handles.text23,'String','D23  ~ U [                ,                 ]');
set(handles.text31,'String','D31  ~ U [                ,                 ]');
set(handles.text32,'String','D32  ~ U [                ,                 ]');
set(handles.text33,'String','D33  ~ U [                ,                 ]');

    case 5
set(handles.text11,'String','Ed11  ~ U [                ,                 ]');
set(handles.text12,'String','Ed12  ~ U [                ,                 ]');
set(handles.text13,'String','Ed13  ~ U [                ,                 ]');
set(handles.text21,'String','Ed21  ~ U [                ,                 ]');
set(handles.text22,'String','Ed22  ~ U [                ,                 ]');
set(handles.text23,'String','Ed23  ~ U [                ,                 ]');
set(handles.text31,'String','Ed31  ~ U [                ,                 ]');
set(handles.text32,'String','Ed32  ~ U [                ,                 ]');
set(handles.text33,'String','Ed33  ~ U [                ,                 ]');

    case 6
set(handles.text11,'String','Fd11  ~ U [                ,                 ]');
set(handles.text12,'String','Fd12  ~ U [                ,                 ]');
set(handles.text13,'String','Fd13  ~ U [                ,                 ]');
set(handles.text21,'String','Fd21  ~ U [                ,                 ]');
set(handles.text22,'String','Fd22  ~ U [                ,                 ]');
set(handles.text23,'String','Fd23  ~ U [                ,                 ]');
set(handles.text31,'String','Fd31  ~ U [                ,                 ]');
set(handles.text32,'String','Fd32  ~ U [                ,                 ]');
set(handles.text33,'String','Fd33  ~ U [                ,                 ]');

end

% --- Executes on button press in radio_n.
function radio_n_Callback(hObject, eventdata, handles)
% hObject    handle to radio_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_n
global Para_mat
set(handles.radio_u,'Value',0);
switch Para_mat
    case 1
set(handles.text11,'String','A11  ~ N [                ,                 ]');
set(handles.text12,'String','A12  ~ N [                ,                 ]');
set(handles.text13,'String','A13  ~ N [                ,                 ]');
set(handles.text21,'String','A21  ~ N [                ,                 ]');
set(handles.text22,'String','A22  ~ N [                ,                 ]');
set(handles.text23,'String','A23  ~ N [                ,                 ]');
set(handles.text31,'String','A31  ~ N [                ,                 ]');
set(handles.text32,'String','A32  ~ N [                ,                 ]');
set(handles.text33,'String','A33  ~ N [                ,                 ]');
    case 2
set(handles.text11,'String','B11  ~ N [                ,                 ]');
set(handles.text12,'String','B12  ~ N [                ,                 ]');
set(handles.text13,'String','B13  ~ N [                ,                 ]');
set(handles.text21,'String','B21  ~ N [                ,                 ]');
set(handles.text22,'String','B22  ~ N [                ,                 ]');
set(handles.text23,'String','B23  ~ N [                ,                 ]');
set(handles.text31,'String','B31  ~ N [                ,                 ]');
set(handles.text32,'String','B32  ~ N [                ,                 ]');
set(handles.text33,'String','B33  ~ N [                ,                 ]');
    case 3
set(handles.text11,'String','C11  ~ N [                ,                 ]');
set(handles.text12,'String','C12  ~ N [                ,                 ]');
set(handles.text13,'String','C13  ~ N [                ,                 ]');
set(handles.text21,'String','C21  ~ N [                ,                 ]');
set(handles.text22,'String','C22  ~ N [                ,                 ]');
set(handles.text23,'String','C23  ~ N [                ,                 ]');
set(handles.text31,'String','C31  ~ N [                ,                 ]');
set(handles.text32,'String','C32  ~ N [                ,                 ]');
set(handles.text33,'String','C33  ~ N [                ,                 ]');

    case 4
set(handles.text11,'String','D11  ~ N [                ,                 ]');
set(handles.text12,'String','D12  ~ N [                ,                 ]');
set(handles.text13,'String','D13  ~ N [                ,                 ]');
set(handles.text21,'String','D21  ~ N [                ,                 ]');
set(handles.text22,'String','D22  ~ N [                ,                 ]');
set(handles.text23,'String','D23  ~ N [                ,                 ]');
set(handles.text31,'String','D31  ~ N [                ,                 ]');
set(handles.text32,'String','D32  ~ N [                ,                 ]');
set(handles.text33,'String','D33  ~ N [                ,                 ]');
    case 5
set(handles.text11,'String','Ed11  ~ N [                ,                 ]');
set(handles.text12,'String','Ed12  ~ N [                ,                 ]');
set(handles.text13,'String','Ed13  ~ N [                ,                 ]');
set(handles.text21,'String','Ed21  ~ N [                ,                 ]');
set(handles.text22,'String','Ed22  ~ N [                ,                 ]');
set(handles.text23,'String','Ed23  ~ N [                ,                 ]');
set(handles.text31,'String','Ed31  ~ N [                ,                 ]');
set(handles.text32,'String','Ed32  ~ N [                ,                 ]');
set(handles.text33,'String','Ed33  ~ N [                ,                 ]');
    case 6
set(handles.text11,'String','Fd11  ~ N [                ,                 ]');
set(handles.text12,'String','Fd12  ~ N [                ,                 ]');
set(handles.text13,'String','Fd13  ~ N [                ,                 ]');
set(handles.text21,'String','Fd21  ~ N [                ,                 ]');
set(handles.text22,'String','Fd22  ~ N [                ,                 ]');
set(handles.text23,'String','Fd23  ~ N [                ,                 ]');
set(handles.text31,'String','Fd31  ~ N [                ,                 ]');
set(handles.text32,'String','Fd32  ~ N [                ,                 ]');
set(handles.text33,'String','Fd33  ~ N [                ,                 ]');
end
