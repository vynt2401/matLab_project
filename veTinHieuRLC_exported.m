classdef veTinHieuRLC_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                 matlab.ui.Figure
        NhpvoRohmEditFieldLabel  matlab.ui.control.Label
        EditFieldR               matlab.ui.control.NumericEditField
        NhpvoLHEditFieldLabel    matlab.ui.control.Label
        EditFieldL               matlab.ui.control.NumericEditField
        NhpvoCuFEditFieldLabel   matlab.ui.control.Label
        EditFieldC               matlab.ui.control.NumericEditField
        ButtonDraw               matlab.ui.control.Button
        UIAxes                   matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ButtonDraw
        function ButtonDrawPushed(app, event)
                r = app.EditFieldR.Value;
                l = app.EditFieldL.Value;
                c = app.EditFieldC.Value;
                w = 0: 0.01 : 2*pi;
                z = abs(r + 1j*w*l + (1./(1j*w*c)));
                
                %new comment in this file
                plot(app.UIAxes, w, z);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create NhpvoRohmEditFieldLabel
            app.NhpvoRohmEditFieldLabel = uilabel(app.UIFigure);
            app.NhpvoRohmEditFieldLabel.HorizontalAlignment = 'right';
            app.NhpvoRohmEditFieldLabel.Position = [10 412 100 22];
            app.NhpvoRohmEditFieldLabel.Text = 'Nhập vào R(ohm)';

            % Create EditFieldR
            app.EditFieldR = uieditfield(app.UIFigure, 'numeric');
            app.EditFieldR.Position = [125 412 100 22];

            % Create NhpvoLHEditFieldLabel
            app.NhpvoLHEditFieldLabel = uilabel(app.UIFigure);
            app.NhpvoLHEditFieldLabel.HorizontalAlignment = 'right';
            app.NhpvoLHEditFieldLabel.Position = [23 381 87 22];
            app.NhpvoLHEditFieldLabel.Text = 'Nhập vào L(H) ';

            % Create EditFieldL
            app.EditFieldL = uieditfield(app.UIFigure, 'numeric');
            app.EditFieldL.Position = [125 381 100 22];

            % Create NhpvoCuFEditFieldLabel
            app.NhpvoCuFEditFieldLabel = uilabel(app.UIFigure);
            app.NhpvoCuFEditFieldLabel.HorizontalAlignment = 'right';
            app.NhpvoCuFEditFieldLabel.Position = [19 345 91 22];
            app.NhpvoCuFEditFieldLabel.Text = 'Nhập vào C(uF)';

            % Create EditFieldC
            app.EditFieldC = uieditfield(app.UIFigure, 'numeric');
            app.EditFieldC.Position = [125 345 100 22];

            % Create ButtonDraw
            app.ButtonDraw = uibutton(app.UIFigure, 'push');
            app.ButtonDraw.ButtonPushedFcn = createCallbackFcn(app, @ButtonDrawPushed, true);
            app.ButtonDraw.Position = [68 189 100 22];
            app.ButtonDraw.Text = 'Vẽ';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Tổng trở theo w')
            xlabel(app.UIAxes, 'w')
            ylabel(app.UIAxes, '|z|')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [234 189 371 260];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = veTinHieuRLC_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end