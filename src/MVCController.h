#ifndef MVCCONTROLLER_H
#define MVCCONTROLLER_H
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include "MVCModel.h"
#include "MVCView.h"

class MVCController{
    public:
        MVCController(GLFWwindow*);
        void bind(MVCModel*, MVCView*);
        void run();
    private:
        GLFWwindow* window;
        MVCModel* model;
        MVCView* view;
};

#endif