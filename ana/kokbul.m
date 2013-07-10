function varargout = kokbul(varargin)
% KOKBUL M-file for kokbul.fig
%      KOKBUL, by itself, creates a new KOKBUL or raises the existing
%      singleton*.
%
%      H = KOKBUL returns the handle to a new KOKBUL or the handle to
%      the existing singleton*.
%
%      KOKBUL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KOKBUL.M with the given input arguments.
%
%      KOKBUL('Property','Value',...) creates a new KOKBUL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kokbul_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kokbul_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help kokbul

% Last Modified by GUIDE v2.5 17-Nov-2012 02:36:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kokbul_OpeningFcn, ...
                   'gui_OutputFcn',  @kokbul_OutputFcn, ...
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


% --- Executes just before kokbul is made visible.
function kokbul_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kokbul (see VARARGIN)

% Choose default command line output for kokbul
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kokbul wait for user response (see UIRESUME)
% uiwait(handles.figure1);

javaFrame = get(hObject,'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('omulogo.jpg'));
% --- Outputs from this function are returned to the command line.
function varargout = kokbul_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function altsinir_Callback(hObject, eventdata, handles)
    handles.alt = str2double( get(hObject,'String') );
guidata(hObject, handles);

function altsinir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function usts_Callback(hObject, eventdata, handles)
    handles.ust = str2double( get(hObject,'String') );
guidata(hObject, handles);


function usts_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xsif_Callback(hObject, eventdata, handles)
    handles.x0 = str2double( get(hObject,'String') );
guidata(hObject, handles);


function xsif_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xbir_Callback(hObject, eventdata, handles)
    handles.x1 = str2double( get(hObject,'String') );
guidata(hObject, handles);



function xbir_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eps_Callback(hObject, eventdata, handles)
    handles.epsilon = str2double( get(hObject,'String') );
guidata(hObject, handles);

function eps_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function yonts_Callback(hObject, eventdata, handles)
    contents = cellstr(get(hObject,'String'));
    gecmen = {};
    switch get(hObject,'Value')
        case 1
            handles.goster = 'Lütfen seçim yapýnýz!!!';
        case 2
            syms x;
            handles.turfonk =inline( diff(handles.fonks(x) ) );
            [handles.sonuc, handles.adim] = newtrap(handles.turfonk, handles.fonks, handles.alt, handles.ust, handles.x0, handles.epsilon );
            gecmen{1} = 'Newton-Rapson Yöntemi';
            gecmen{2} = '';
            if isnumeric(handles.sonuc)
                gecmen{4} = ['Kök : ',num2str(handles.sonuc, '%.15f')];
                gecmen{3} = ['Adim Sayisi : ',num2str(handles.adim) ];
            else
                gecmen{3} = ['HATA : ',handles.sonuc];
            end
            handles.goster = gecmen;
        case 3
            [handles.sonuc, handles.adim] = regularfalsi(handles.fonks, handles.alt, handles.ust, handles.epsilon);
            gecmen{1} = 'Regula-Falsi Yöntemi';
            gecmen{2} = '';
            if isnumeric(handles.sonuc)
                gecmen{4} = ['Kök : ',num2str(handles.sonuc, '%.15f')];
                gecmen{3} = ['Adim Sayisi : ',num2str(handles.adim-1) ];
            else
                gecmen{3} = ['HATA : ',handles.sonuc];
            end
            handles.goster = gecmen;
        case 4
            [handles.sonuc, handles.adim] = yarilama(handles.fonks, handles.alt, handles.ust, handles.epsilon);
            gecmen{1} = 'Bisection Yöntemi';
            gecmen{2} = '';
            if isnumeric(handles.sonuc)
                gecmen{4} = ['Kök : ',num2str(handles.sonuc, '%.15f')];
                gecmen{3} = ['Adim Sayisi : ',num2str(handles.adim-1) ];
            else
                gecmen{3} = ['HATA : ',handles.sonuc];
            end
            handles.goster = gecmen;
        case 5
            [handles.sonuc, handles.adim] = secant(handles.fonks, handles.alt, handles.ust, handles.x0, handles.x1, handles.epsilon);
            gecmen{1} = 'Secant Yöntemi';
            gecmen{2} = '';
            if isnumeric(handles.sonuc)
                gecmen{4} = ['Kök : ',num2str(handles.sonuc, '%.15f')];
                gecmen{3} = ['Adim Sayisi : ',num2str(handles.adim-1) ];
            else
                gecmen{3} = ['HATA : ',handles.sonuc];
            end
            handles.goster = gecmen;
    end
guidata(hObject, handles);

function yonts_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fonk_Callback(hObject, eventdata, handles)
    handles.fonks = inline(get(hObject,'String'));
guidata(hObject, handles);


function fonk_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calis_Callback(hObject, eventdata, handles)
    set(handles.cikdi,'String',handles.goster);
guidata(hObject, handles);

function cikdi_CreateFcn(hObject, eventdata, handles)

