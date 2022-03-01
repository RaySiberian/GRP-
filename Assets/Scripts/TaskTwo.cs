using UnityEngine;

public class TaskTwo : MonoBehaviour
{
    [SerializeField] private Transform another;
    [SerializeField] private float offset;

    private void OnDrawGizmos()
    {
        var tempDirection = another.position - transform.position;
        Gizmos.color = Vector3.Dot(transform.up,tempDirection.normalized) > offset ? Color.red : Color.green;
        //Debug.Log(Vector3.Dot(transform.up,tempDirection));
        Gizmos.DrawLine(transform.position,transform.up);
    }
}
