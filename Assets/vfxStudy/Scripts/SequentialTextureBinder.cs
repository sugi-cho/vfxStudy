using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class SequentialTextureBinder : MonoBehaviour
{
    public Texture2D colorAlphaTex;
    public Texture2D seaquentialTex;
    [SerializeField]Texture2D uvPackTex;
    
    [ContextMenu("generate")]
    void GenerateTex(){
        
    }
}
