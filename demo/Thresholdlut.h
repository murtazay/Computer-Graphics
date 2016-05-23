#ifndef THRESHOLDLUT_H
#define THRESHOLDLUT_H

#include "HW.h"
#include <QGLShaderProgram>
#include <QtOpenGL>

class ThresholdLut:public HW{
    Q_OBJECT
public:
    ThresholdLut(QWidget *parent=0);
    QGroupBox*	controlPanel        ();		// create control panel
    void		reset               ();		// reset parameters
    void		initVertexBuffer    ();		// init vertices
    void		initShaders         ();		// init shaders
    void		initTexture         ();		// init texture image
    void        initLut        (float);
public slots:
    void        setThreshold(int);
protected:
    void		initializeGL        ();                 // init GL state
    void		resizeGL	(int, int);                 // resize GL widget
    void		paintGL             ();                 // render GL scene
private:
    int                 m_winW;
    int                 m_winH;
    float               m_threshold;
    int                 m_lut[256];
    int                 m_numofpoints;
    QImage              m_image;
    GLuint              m_u_threshold;
    GLuint              m_texture;
    GLuint              m_texture1;
    GLuint              m_u_sampler;
    QGLShaderProgram    m_program;
    QGroupBox          *m_ctrlGrp;
    std::vector<vec2>   m_points;
    QSlider		*m_slider ;	// Threshold sliders
    QSpinBox	*m_spinBox;	// Threshold spin boxes
};

#endif // THRESHOLDLUT_H
