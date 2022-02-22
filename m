Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1724C7092
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Feb 2022 16:29:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nOhxs-0008Cp-H9
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Feb 2022 15:29:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <atomlin@redhat.com>) id 1nMZPg-0007mH-R9
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Feb 2022 17:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJzZgeDzNY7zmhhmPD8Ts6QhadgVuW+LtnZrIEdFmk4=; b=kGhK2LnEYPx+lnqxpHanGpO/Or
 /kcieUmXRWSvjjgA8ryvLXi8cwza6wId8bLLCG5kh94xiP1TnjPiwuw5dI5TJl+kwdyHwKLF3gV/4
 ZAsbd8ETnI83U9c9D6WERk/0WS2WXueoLDkNN5Beh1OaGzTdR0a9cFeT6oGImNYrX8cY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hJzZgeDzNY7zmhhmPD8Ts6QhadgVuW+LtnZrIEdFmk4=; b=JwJBoRP338Ut7LXYfIst3Ju93P
 8sr4vnaWXQIOjQc/yFoHedfxJ6Q0Vzcv/2LYorVxTm0rrGazqN2d6sHxGwG4WDpmoQBZ1B6DmvRQH
 dMidkzr1kRt9Yb+u17k8Wg0XZvXZ8OAa/dA8l7E2tdA9lS21+qRbJpah4w8pmI0/2TUE=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nMZPX-0007OQ-EU
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Feb 2022 17:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645552629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hJzZgeDzNY7zmhhmPD8Ts6QhadgVuW+LtnZrIEdFmk4=;
 b=T1Y9hBwCAp+Zn3JT6xpWEyfR1QnIkNsNMbNa0BCflRWedtGlB462I+lGaEoHcP4V1TJhZP
 Y/fNCDutTY6NhAhdkWT4fTVio5jQVUpuUgVhph/TgUp+maViTvhK5FviAofX6b0fK7h1Pn
 LxXWOO54mMx53cPpxdj5kuGVmMfpA3I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-rKnaib_mMsGO9apeZJdRMg-1; Tue, 22 Feb 2022 12:57:07 -0500
X-MC-Unique: rKnaib_mMsGO9apeZJdRMg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w26-20020adf8bda000000b001e33dbc525cso9195539wra.18
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Feb 2022 09:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hJzZgeDzNY7zmhhmPD8Ts6QhadgVuW+LtnZrIEdFmk4=;
 b=y3auebQk6zlJgImnYRd9A2PmUdZAPevF9mGsPerxgiyTb8hoUlkYOxOfVAoxyfF2yt
 oRzJ+H0bYNf+3B2kqakyNADY3RsyBblP/Cpgpb1cCakoamtcQJ48nxxF8Pw+vt6Hhwlc
 zOjvMeGA/658jqAlGN9TU+xsyT4V3s+h3dkHERePNhSX6HlyGxl94VAOWtIIJzGUrH0f
 1GjFNZdXokYb4CuAnFycJc8X4OV4Yaml+P+Tu3EUJ6ZRfB3acDvWx9Dz7e21/VY3IFZC
 ub0atjEMMU1MNP55Hy74kgqDpIy1iQi1EvafKj9tTfBhtNwomOcynYyEiMAsLUixoxZ0
 8N3g==
X-Gm-Message-State: AOAM533iP22r5xL3etFbh6LVi7pp5Fv4FjxuSsTqcrrrb8PNz7r1EJK6
 wOSx7Q8h4ASZ1V5f7m044AAXs3yd7TNrNwLbsn7+8NvQDKp5tEjlJ1HI2FTVhQjXGilQAQ8SftY
 IZn+4op+v0ratj1ymPjSXQjevFqwcO8rX5g==
X-Received: by 2002:adf:e10a:0:b0:1e3:3188:79c7 with SMTP id
 t10-20020adfe10a000000b001e3318879c7mr20431442wrz.329.1645552626669; 
 Tue, 22 Feb 2022 09:57:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBLqieyLWhR9YxZvOyFiDe21CGa5pv2+OROhVCjx6WLj1pEI28rUPcGkTq6FUILDxoAizVhQ==
X-Received: by 2002:adf:e10a:0:b0:1e3:3188:79c7 with SMTP id
 t10-20020adfe10a000000b001e3318879c7mr20431432wrz.329.1645552626509; 
 Tue, 22 Feb 2022 09:57:06 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net.
 [82.17.115.212])
 by smtp.gmail.com with ESMTPSA id e7sm33021244wrg.44.2022.02.22.09.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:57:06 -0800 (PST)
Date: Tue, 22 Feb 2022 17:57:05 +0000
From: Aaron Tomlin <atomlin@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <20220222175705.ryqmhhrpokx7xbgv@ava.usersys.com>
X-PGP-Key: http://pgp.mit.edu/pks/lookup?search=atomlin%40redhat.com
X-PGP-Fingerprint: 7906 84EB FA8A 9638 8D1E  6E9B E2DE 9658 19CC 77D6
References: <cover.1645541930.git.christophe.leroy@csgroup.eu>
 <c9584f48abce748e62e65e6757ceb23800f15380.1645541930.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <c9584f48abce748e62e65e6757ceb23800f15380.1645541930.git.christophe.leroy@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=atomlin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2022-02-22 16:00 +0100, Christophe Leroy wrote: > In
 order to separate text and data, we need to setup > two rb trees. > > This
 means that struct mod_tree_root is required even without > MODULE [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nMZPX-0007OQ-EU
X-Mailman-Approved-At: Mon, 28 Feb 2022 15:29:30 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v5 1/6] module: Always have struct
 mod_tree_root
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-arch@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2022-02-22 16:00 +0100, Christophe Leroy wrote:
> In order to separate text and data, we need to setup
> two rb trees.
> 
> This means that struct mod_tree_root is required even without
> MODULES_TREE_LOOKUP.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  kernel/module/internal.h | 4 +++-
>  kernel/module/main.c     | 5 -----
>  2 files changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

-- 
Aaron Tomlin



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
