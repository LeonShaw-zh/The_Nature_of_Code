#include "MVCModel.h"
#include <math.h>

MVCModel::MVCModel(){
    glGenVertexArrays(1, &VAO);
    glBindVertexArray(VAO);
    int number_of_point = 100;
    float *vertices = getCircle(number_of_point);
    unsigned int VBO;
    glGenBuffers(1, &VBO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, 3 * number_of_point * sizeof(float), vertices, GL_STATIC_DRAW);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void *)0);
    glEnableVertexAttribArray(0);
    glBindVertexArray(0);
}

MVCModel::~MVCModel(){
}

void MVCModel::draw(){
    glBindVertexArray(VAO);
    glDrawArrays(GL_LINE_LOOP, 0, 100);
}

float* MVCModel::getCircle(int n){
    float r = 0.5;
    float pi = 3.1415926;
    float* vertices = new float[3*n];
    for(int i=0; i<n; i++){
        int j = 3*i;
        float ran = 2 * pi * i / n;
        vertices[j] = r * cos(ran);
        vertices[j+1] = r * sin(ran);
        vertices[j+2] = 0;
    }
    return vertices;
}