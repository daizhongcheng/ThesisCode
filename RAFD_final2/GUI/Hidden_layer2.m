function varargout = Hidden_layer2(varargin)
% HIDDEN_LAYER2 MATLAB code for Hidden_layer2.fig
%      HIDDEN_LAYER2, by itself, creates a new HIDDEN_LAYER2 or raises the existing
%      singleton*.
%
%      H = HIDDEN_LAYER2 returns the handle to a new HIDDEN_LAYER2 or the handle to
%      the existing singleton*.
%
%      HIDDEN_LAYER2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HIDDEN_LAYER2.M with the given input arguments.
%
%      HIDDEN_LAYER2('Property','Value',...) creates a new HIDDEN_LAYER2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hidden_layer2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hidden_layer2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hidden_layer2

% Last Modified by GUIDE v2.5 09-Feb-2017 12:20:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hidden_layer2_OpeningFcn, ...
                   'gui_OutputFcn',  @Hidden_layer2_OutputFcn, ...
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


% --- Executes just before Hidden_layer2 is made visible.
function Hidden_layer2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hidden_layer2 (see VARARGIN)

% Choose default command line output for Hidden_layer2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hidden_layer2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hidden_layer2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes_hidden_background_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_hidden_background (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_hidden_background
text('Interpreter','latex','Units','Normalized','String',... 
    '$$t = \left[ {\matrix{v_1 &v_2  } } \right]$$',...
    'Position',[.25 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\left[ {\matrix{\varphi_{1} \cr \varphi_{2}  \cr } } \right]$$',...
    'Position',[.57 .8],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    'The combination of $$ \left[ {\matrix{v_1 &v_2  } } \right]$$ :',...
    'Position',[.15 .55],'FontSize',13,'Fontname','MS Sans Serif')



function edit_pr_10_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_10 as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_10 as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pr_01_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_01 as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_01 as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_01_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pr_11_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_11 as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_11 as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in pushbutton_hidden_close.
function pushbutton_hidden_close_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_hidden_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
close all;
end

% --- Executes on button press in pushbutton_hidden_next.
function pushbutton_hidden_next_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_hidden_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FaultNr_now
handles=guihandles;

pr10 = str2double(get(handles.edit_pr_10,'String'));
pr01 = str2double(get(handles.edit_pr_01,'String'));
pr11 = str2double(get(handles.edit_pr_11,'String'));

if (pr10<0)||(pr10>100)
    errordlg('The probability should belong to [0,1].','Error');
else
    
    if (pr01<0)||(pr01>100)
        errordlg('The probability should belong to [0,1].','Error');
    else
        if (pr11<0)||(pr11>100)
            errordlg('The probability should belong to [0,1].','Error');
        else
            
            sum = pr10+pr01+pr11;
            if sum==100
                load('fileData.mat');
                f_parameter.Hidden_pro(2,:,FaultNr_now) = [pr01 pr10 pr11];
                save ('fileData','f_parameter');
                close;  
            else
                errordlg('The sum of all probabilities should be 100%.','Probability error')
            end
        end
        
    end
end



% --- Executes on button press in pushbutton_hidden_back.
function pushbutton_hidden_back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_hidden_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Parameter_layer;
