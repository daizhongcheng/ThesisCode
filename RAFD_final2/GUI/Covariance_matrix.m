function varargout = Covariance_matrix(varargin)
% COVARIANCE_MATRIX MATLAB code for Covariance_matrix.fig
%      COVARIANCE_MATRIX, by itself, creates a new COVARIANCE_MATRIX or raises the existing
%      singleton*.
%
%      H = COVARIANCE_MATRIX returns the handle to a new COVARIANCE_MATRIX or the handle to
%      the existing singleton*.
%
%      COVARIANCE_MATRIX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COVARIANCE_MATRIX.M with the given input arguments.
%
%      COVARIANCE_MATRIX('Property','Value',...) creates a new COVARIANCE_MATRIX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Covariance_matrix_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Covariance_matrix_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Covariance_matrix

% Last Modified by GUIDE v2.5 28-Mar-2017 10:14:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Covariance_matrix_OpeningFcn, ...
                   'gui_OutputFcn',  @Covariance_matrix_OutputFcn, ...
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


% --- Executes just before Covariance_matrix is made visible.
function Covariance_matrix_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Covariance_matrix (see VARARGIN)

% Choose default command line output for Covariance_matrix
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Covariance_matrix wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Covariance_matrix_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton_ok.
function pushbutton_ok_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_type

if isempty(get(handles.edit_samplesize,'String'))
    errordlg('Please set sample size.','Error');
else
    switch Data_type
        case 1
            Significancelvl = str2double(get(handles.popup_siglvl,'String'));
            Accuracy = str2double(get(handles.popup_accuracy,'String'));
            load('fileData.mat');
            f_parameter.Covariance(1,1:3) = [str2double(get(handles.edit_dim,'String')) str2double(get(handles.edit_min,'String')) str2double(get(handles.edit_max,'String')) ];
            f_parameter.samples_para = {Significancelvl, Accuracy };
            f_parameter.Sample_Size = str2double(get(handles.edit_samplesize,'String'));
            save ('fileData','f_parameter');
            close;
            Export_ndata;
        case 2
            if isempty(get(handles.edit_kpi,'String'))
                errordlg('Please set KPI.','Error');
            else
                Significancelvl = str2double(get(handles.popup_siglvl,'String'));
                Accuracy = str2double(get(handles.popup_accuracy,'String'));
                load('fileData.mat');
                f_parameter.Covariance(1,1:3) = [str2double(get(handles.edit_dim,'String')) str2double(get(handles.edit_min,'String')) str2double(get(handles.edit_max,'String')) ];
                f_parameter.samples_para = {Significancelvl, Accuracy };
                f_parameter.Sample_Size = str2double(get(handles.edit_samplesize,'String'));
                f_parameter.kpi = str2double(get(handles.edit_kpi,'String'));
                save ('fileData','f_parameter');
                close;
                Export_ndata;
            end
    end
end


function edit_dim_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dim as text
%        str2double(get(hObject,'String')) returns contents of edit_dim as a double


% --- Executes during object creation, after setting all properties.
function edit_dim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global Data_type
switch Data_type
    case 1
        set(hObject,'Position',[41.400000000000006 35.18131868131869 16.400000000000006 2.428571428571427]);
    case 2
        set(hObject,'Position',[31.60000000000023 35.18131868131869 16.400000000000006 2.428571428571427]);
end



function edit_min_Callback(hObject, eventdata, handles)
% hObject    handle to edit_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_min as text
%        str2double(get(hObject,'String')) returns contents of edit_min as a double


% --- Executes during object creation, after setting all properties.
function edit_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_max as text
%        str2double(get(hObject,'String')) returns contents of edit_max as a double


% --- Executes during object creation, after setting all properties.
function edit_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
text('Interpreter','latex','Units','Normalized','String',...
     '$$\Lambda  = \left[ {\matrix{{{\lambda _1}} & 0 &  \cdots  & 0 & 0  \cr 0 & {{\lambda _2}} & {} & 0 & 0  \cr \vdots  &  \vdots  &  \ddots  &  \vdots  &  \vdots   \cr 0 & 0 & {} & {{\lambda _{n - 1}}} & 0  \cr 0 & 0 &  \cdots  & 0 & {\lambda_n}  \cr } } \right]$$',...
    'Position',[.01 .52],'FontSize',17);


% --- Executes on button press in pushbutton_unc.
function pushbutton_unc_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_unc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Uncertainty_datadriven;
handles=guihandles;


% --- Executes on button press in pushbutton_cancel.
function pushbutton_cancel_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on selection change in popup_siglvl.
function popup_siglvl_Callback(hObject, eventdata, handles)
% hObject    handle to popup_siglvl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_siglvl contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_siglvl


% --- Executes during object creation, after setting all properties.
function popup_siglvl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_siglvl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_accuracy.
function popup_accuracy_Callback(hObject, eventdata, handles)
% hObject    handle to popup_accuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_accuracy contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_accuracy


% --- Executes during object creation, after setting all properties.
function popup_accuracy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_accuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_samplesize_Callback(hObject, eventdata, handles)
% hObject    handle to edit_samplesize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_samplesize as text
%        str2double(get(hObject,'String')) returns contents of edit_samplesize as a double


% --- Executes during object creation, after setting all properties.
function edit_samplesize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_samplesize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(handles.popup_siglvl,'Value')
    case 1
     Significancelvl = 0.01;
    case 2
     Significancelvl = 0.02;
    case 3
        Significancelvl = 0.03;
    case 4
        Significancelvl = 0.04;
    case 5
        Significancelvl = 0.05;
    case 6
        Significancelvl = 0.1;
end

switch get(handles.popup_accuracy,'Value')
    case 1
     Accuracy = 0.01;
    case 2
     Accuracy = 0.02;
    case 3
        Accuracy = 0.03;
    case 4
        Accuracy = 0.04;
    case 5
        Accuracy = 0.05;
    case 6
        Accuracy = 0.1;
end

sample_size = chernoff(Significancelvl,Accuracy,2);
set(handles.edit_samplesize,'String',num2str(sample_size));


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
switch Data_type
    case 1
        set(hObject,'Position',[17.6 35.25274725274725 19.6 1.571428571428573]);
    case 2
        set(hObject,'Position',[10.200000000000017 35.25274725274725 19.6 1.571428571428573]);
end



function edit_kpi_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kpi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kpi as text
%        str2double(get(hObject,'String')) returns contents of edit_kpi as a double


% --- Executes during object creation, after setting all properties.
function edit_kpi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kpi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global Data_type
switch Data_type
    case 1
        set(hObject,'Visible','Off');
    case 2
        set(hObject,'Visible','On');
end

% --- Executes during object creation, after setting all properties.
function text14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Data_type
switch Data_type
    case 1
        set(hObject,'Visible','Off');
    case 2
        set(hObject,'Visible','On');
end
