function varargout = jacob(varargin)
% JACOB M-file for jacob.fig
%      JACOB, by itself, creates a new JACOB or raises the existing
%      singleton*.
%
%      H = JACOB returns the handle to a new JACOB or the handle to
%      the existing singleton*.
%
%      JACOB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JACOB.M with the given input arguments.
%
%      JACOB('Property','Value',...) creates a new JACOB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before jacob_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to jacob_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help jacob

% Last Modified by GUIDE v2.5 20-Nov-2012 02:56:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @jacob_OpeningFcn, ...
                   'gui_OutputFcn',  @jacob_OutputFcn, ...
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


% --- Executes just before jacob is made visible.
function jacob_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to jacob (see VARARGIN)

% Choose default command line output for jacob
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes jacob wait for user response (see UIRESUME)
% uiwait(handles.figure1);
javaFrame = get(hObject,'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('omulogo.jpg'));

% --- Outputs from this function are returned to the command line.
function varargout = jacob_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function matr1_Callback(hObject, eventdata, handles)
    gecici1 = inline( get(hObject,'String') );
    handles.mt1 = gecici1(1);
guidata(hObject, handles);

function matr1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mats2_Callback(hObject, eventdata, handles)
    gecici2 = inline( get(hObject,'String') );
    handles.mt2 = gecici2(1);
guidata(hObject, handles);

function mats2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ilkcoz_Callback(hObject, eventdata, handles)
    gecici3 = inline( get(hObject,'String') );
    handles.ilkcoz = gecici3(1);
guidata(hObject, handles);

function ilkcoz_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function toler_Callback(hObject, eventdata, handles)
    handles.tolerans = str2double(get(hObject,'String'));
guidata(hObject, handles);

function toler_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxit_Callback(hObject, eventdata, handles)
    handles.miter = str2double(get(hObject,'String'));
guidata(hObject, handles);

function maxit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function bas_Callback(hObject, eventdata, handles)
    [sonuc, adim] = jacobi(handles.mt1, handles.mt2, handles.ilkcoz, handles.toler, handles.miter);
    
    if adim> handles.miter
        handles.goster1 = num2str(sonuc);
        handles.goster2 = 'jacobi yakinsamadi';
        handles.goster3 = 'Xnew';
    else
        handles.goster1 = num2str(sonuc);
        handles.goster2 = 'jacobi yakinsadi';
        handles.goster3 = 'Xnew';
    end
    set(handles.cikis,'String', handles.goster1 );
    set(handles.cikdi2,'String', handles.goster2 );
    set(handles.xlc,'String', handles.goster3 );
guidata(hObject, handles);

function cikis_CreateFcn(hObject, eventdata, handles)

function cikdi2_CreateFcn(hObject, eventdata, handles)

function xlc_CreateFcn(hObject, eventdata, handles)
