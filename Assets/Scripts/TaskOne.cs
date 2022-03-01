using UnityEditor;
using UnityEngine;

public class TaskOne : MonoBehaviour
{
    [SerializeField] private Transform another;
    [SerializeField] private float radius;

    //Закэшировать 
    private void OnDrawGizmos()
    {
        float dist = Mathf.Sqrt(Mathf.Pow(transform.position.x - another.position.x, 2) +
                     Mathf.Pow(transform.position.x - another.position.y, 2) +
                     Mathf.Pow(transform.position.z - another.position.z, 2));
       
        Handles.color = dist < radius ? Color.red : Color.green;

        Handles.DrawWireDisc(transform.position, transform.forward, radius);
    }
}