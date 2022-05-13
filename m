Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9947525F99
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 May 2022 12:14:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1npSJD-0004DO-Sn
	for lists+kgdb-bugreport@lfdr.de; Fri, 13 May 2022 10:14:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <arnd@arndb.de>) id 1npSJC-0004By-Gh
 for kgdb-bugreport@lists.sourceforge.net; Fri, 13 May 2022 10:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JtasXN7nK5rJ2BZjcv2sv1DFj6iGJY9mU5GY1WlTitY=; b=YwSYDYVpNNQoDyNERC1jpA8U1z
 Ib23Zsip8/UG7jbfLDEjh1ySySV/s8mudrmLXlrRAVRKticzKcDwKdShYK8xzvrBaEcvkkXY7Ha8l
 ZNiLLsAt1OUOJT8cZFkq9PGXtPh6a3Dp2vnt8CLkPUGsDlZLSQ6ZvRyWlaRVLsz8QmJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JtasXN7nK5rJ2BZjcv2sv1DFj6iGJY9mU5GY1WlTitY=; b=Di1YO5aGA47TtAdN63gRieOoDX
 aBcUBj515v4XBwZSS5fusvGPiIAfcDpC4ywidI01fUbbt4aWmoWVD1wzgUfZcB9Swl85y8RsQUa+Q
 iXqPuwMGf+mhiWBClBCJXJQvFxQtja60mBN+ylhLrYJ8FqpukRiWHkXO2PlDbzHlRW1g=;
Received: from mout.kundenserver.de ([212.227.126.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npSJA-00Ak2h-NT
 for kgdb-bugreport@lists.sourceforge.net; Fri, 13 May 2022 10:14:06 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N0WsG-1o1m4636mq-00wURA for <kgdb-bugreport@lists.sourceforge.net>; Fri, 13
 May 2022 12:13:54 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso85172187b3.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 13 May 2022 03:13:54 -0700 (PDT)
X-Gm-Message-State: AOAM532+k7rKcKx1a0a+Wwtktx9gDSHz3KkBSfXYKpWX2oKdziNA2HpT
 0C0n2wWxp0QfG4uwclI2l8qb+TQN1H+tN2k+z64=
X-Google-Smtp-Source: ABdhPJyHEUP1cRPCzvCwXdPdUSFS+Voh0iZfVi5t4LZi15vwg6YIdcUM0F8JfOUB45yvtXzHOEpnm/S+mdBFUW/UN8c=
X-Received: by 2002:a0d:cd06:0:b0:2f8:f39c:4cfc with SMTP id
 p6-20020a0dcd06000000b002f8f39c4cfcmr4713890ywd.495.1652436833571; Fri, 13
 May 2022 03:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
 <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
 <Yntcn4esjJRS50Am@kroah.com>
In-Reply-To: <Yntcn4esjJRS50Am@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 May 2022 12:13:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rF7Y27UiGyk34b0KTfvU30rkuoN5GyuNuwcA-V61_-w@mail.gmail.com>
Message-ID: <CAK8P3a3rF7Y27UiGyk34b0KTfvU30rkuoN5GyuNuwcA-V61_-w@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Provags-ID: V03:K1:kwoIk1UjbAP4Cuu0ugxTjyefqOapCP+ATgMCoi6NNf3sDzEzy3J
 AtmpjJTxenowkXuEkoMk5D5s+9qtGNVIF9lHoZV7rRhFeCkLzC6Uq5dv8vOTy9ajC5/UmSP
 uLJHF1iBRA1dsuvVizj/bxI9+wnmw7s9q2Ch6f80muDhGiZ0P7n1NC0CMNwIyL4NZS2ihKH
 X6eNN+3yg5zgrcxTzPGUg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zpMtPPVZo+g=:JCAY2au1Ey6AaDMB0WiNd8
 3g2PRFZgNtPqLforybonWC3THr0cjAvDoMXACT8bjZs0Var+fyV0Urbu+PD2dIJ7equ4WuEVC
 oBFWCNWI90XFBP85xAVzJYa8n3g0OUcGdGudspALDdsBWYjIz5+KN7dl0aCCTk4ZyGfqRQUrj
 dlUZah1i7r+//iEAZA0pIrYVxr+av4LmnBoL4R+x6ofUU3USPnYFhBdiMFMGylqGSd3ag4dfm
 8ZJkh6fqOsfprCk1+Kdrp/TLsZfUVcwUmmlPorU36mFtrSG17iSzv+vtYWvBiKxtGzpAbpp3Q
 ENZR/aSxeygbpRC1fZAp5eh1sHoij5dXMY+oHz2biALcfSnXNc7sOT1NfWgKDCDZBKH8la9vR
 sNjsF35+ti2S64oHrQAIZsIxdLWZi55j/Z1sMeMNlVbLSzkvC9djuoQuJKK8HQYQgbRJmgZXN
 fKCj0BXYzT4hTV8Bstq4i8RSe0wgrXZkXi/e5TCei69iUsTgu2QI2mZHNxAo0yc5TohBKi9K1
 ggq8DLE/5f2kkreZ3cYTnFBJKqqNS1jSbIa2TRIx+jJTf3wSBiQXhy+hivF7Wykhv694fy7zV
 2C1CxO0w/pNf5UPr/LnzUftFberlMRlaXq1/ttMCnNmc/nhEZJZWezgEECACsNKrm6d4qFrit
 Entqhlc0CYjc8NkU0PJgR4dIOuYtkzG5WHaB70DX9E495GRdyiRB0zOrTdJXtaLFDdNly9u9M
 OW7+or2EBd1z8otFeZZjhU8MOvON974hY/PpP3ZmVv4bwrIS5lv3JiHWGzHOz/MHmALqnmE/+
 7LRrjOzja8KSyAsfXUREz13k9/+ep3fKYh1D/uD2r3iT0KL3FU=
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11,
 2022 at 8:50 AM Greg KH <gregkh@linuxfoundation.org>
 wrote: > > --- a/drivers/soc/Makefile > > +++ b/drivers/soc/Makefile > >
 @@ -12,6 +12,7 @@ obj-$(CONFIG_SOC_CANAAN) += canaan/ > > [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [212.227.126.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1npSJA-00Ak2h-NT
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/1] soc: fujitsu: Add A64FX
 diagnostic interrupt driver
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Olof Johansson <olof@lixom.net>,
 Jiri Slaby <jirislaby@kernel.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 11, 2022 at 8:50 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > --- a/drivers/soc/Makefile
> > +++ b/drivers/soc/Makefile
> > @@ -12,6 +12,7 @@ obj-$(CONFIG_SOC_CANAAN)    += canaan/
> >  obj-$(CONFIG_ARCH_DOVE)              += dove/
> >  obj-$(CONFIG_MACH_DOVE)              += dove/
> >  obj-y                                += fsl/
> > +obj-y                                += fujitsu/
>
> Why a sub directory for just one .c file?

All the other drivers/soc/ contents are in subdirectories, so I think
I'd keep it like this.
There are also other drivers that have been proposed for fujitsu a64fx.

        Arnd


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
