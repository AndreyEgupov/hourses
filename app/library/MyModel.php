<?php

trait MyModel {
    public function a () {
        $relations = $this->getModelsManager()->getBelongsTo($this);
        foreach($relations as $relation) {
            $options = $relation->getOptions();
            $alias = @$options['alias'];
            debug($relation, $alias, $this->$alias->toArray());
        }
    }
}