#include "overlay_29_02333FAC.h"

u8 EntityIsValid__02333FAC(struct entity *entity)
{
    if (entity == NULL)
    {
        return FALSE;
    }
    return entity->type != ENTITY_NOTHING;
}
