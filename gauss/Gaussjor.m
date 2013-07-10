function varargout = Gaussjor(varargin)
% GAUSSJOR M-file for Gaussjor.fig
%      GAUSSJOR, by itself, creates a new GAUSSJOR or raises the existing
%      singleton*.
%
%      H = GAUSSJOR returns the handle to a new GAUSSJOR or the handle to
%      the existing singleton*.
%
%      GAUSSJOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAUSSJOR.M with the given input arguments.
%
%      GAUSSJOR('Property','Value',...) creates a new GAUSSJOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gaussjor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gaussjor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gaussjor

% Last Modified by GUIDE v2.5 20-Nov-2012 00:58:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gaussjor_OpeningFcn, ...
                   'gui_OutputFcn',  @Gaussjor_OutputFcn, ...
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


% --- Executes just before Gaussjor is made visible.
function Gaussjor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gaussjor (see VARARGIN)

% Choose default command line output for Gaussjor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gaussjor wait for user response (see UIRESUME)
% uiwait(handles.figure1);

javaFrame = get(hObject,'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('omulogo.jpg'));
% --- Outputs from this function are returned to the command line.
function varargout = Gaussjor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function mats1_Callback(hObject, eventdata, handles)
    handles.gecici = inline( get(hObject,'String'));
    handles.mt1 = handles.gecici(1);
guidata(hObject, handles);

function mats1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mats2_Callback(hObject, eventdata, handles)
    gecici1 = inline( get(hObject,'String') );
    handles.mt2 = gecici1(1);
guidata(hObject, handles);

function mats2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function tus_Callback(hObject, eventdata, handles)
    handles.goster = GaussJordan(handles.mt1, handles.mt2);
    if isnumeric(handles.goster)
        set(handles.sonuc,'String',num2str( handles.goster, '%.5f' ) );
    else
        hata = ['HATA : ', handles.goster];
        set(handles.sonuc,'String', hata );
    end
guidata(hObject, handles);

function sonuc_CreateFcn(hObject, eventdata, handles)
