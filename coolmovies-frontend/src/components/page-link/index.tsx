import React, { FC } from 'react';
import Link from 'next/link'
import { Url } from 'url';

interface Props {
    route: string,
}

export const PageLink: FC<Props> = ({ route, children }) => {
    return <Link href={route}>{children}</Link>;
}

