#include "MVCController.h"

MVCController::MVCController(GLFWwindow* w):window(w){}

void MVCController::bind(MVCModel *m, MVCView *v){
    model = m;
    view = v;
    view->bindModel(m);
}

void MVCController::run(){

    glEnable(GL_DEPTH_TEST);
    while(!glfwWindowShouldClose(window)){
        glfwPollEvents();
        glClearColor(0.1f, 0.1f, 0.1f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        
        view->draw();

        glfwSwapBuffers(window);
    }
}

