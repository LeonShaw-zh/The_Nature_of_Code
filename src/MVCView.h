#ifndef MVCVIEW_H
#define MVCVIEW_H
#include "utils/Shader.h"
#include "MVCModel.h"

class MVCView{
    public:
        MVCView();
        ~MVCView();
        void bindModel(MVCModel*);
        void draw();
    private:
        Shader* shader;
        MVCModel* model;
};

#endif