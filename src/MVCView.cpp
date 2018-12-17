#include "MVCView.h"

MVCView::MVCView(){
    shader = new Shader("../src/shader/shader.vs", "../src/shader/shader.fs");
}

MVCView::~MVCView(){
}

void MVCView::bindModel(MVCModel *m){
    model = m;
}

void MVCView::draw(){
    shader->use();
    // glUniform3f(glGetUniformLocation(shader->ID, "color"), model.color.x, model.color.y, model.color.z);
    model->draw();
}