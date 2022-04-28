Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8460512C37
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Apr 2022 09:05:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1njyDA-0005zp-9F
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Apr 2022 07:05:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <arnd@arndb.de>) id 1njyD6-0005zf-8a
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Apr 2022 07:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sHF0pINvq59jdV4QuvG1+ZAAoPVnNSWiqpEWuEUOodI=; b=d8+fZybtk1QhgZkTiydkG3Nt3f
 mUXCWA0wJDw+3/gGT/PRxoeiDnRytYR5pQkvq5VGTGSYHfKmabhrAjxVk6KiZUX9vFEwTodic/2B3
 z3Ggkciirj7mh3dczeenQZwg/srPbNpawmGBGXFztGLxGEmOk2HgIK9xDiw5qXnBJkIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sHF0pINvq59jdV4QuvG1+ZAAoPVnNSWiqpEWuEUOodI=; b=cpJj2lXFJpDhBqgjBA3GTSHJPR
 k5LKfeCZRWbKUyLpAJd7sodKKtrvze2WKBTyLNIVn4PDjBPeuJ0dKjE2xVjYSbTU7D3WGsplmJHec
 U5DLs4P/CnDLKgbQb8XuQeRbnT+izCbI5bqWoUq2ETI/O5N7J1xdavIQrsNBSygXDsGc=;
Received: from mout.kundenserver.de ([212.227.126.135])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njyCz-0001Fl-LC
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Apr 2022 07:05:07 +0000
Received: from mail-yb1-f177.google.com ([209.85.219.177]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M58vU-1nl48U2PmG-001D47 for <kgdb-bugreport@lists.sourceforge.net>; Thu, 28
 Apr 2022 09:04:50 +0200
Received: by mail-yb1-f177.google.com with SMTP id v59so7336165ybi.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 Apr 2022 00:04:50 -0700 (PDT)
X-Gm-Message-State: AOAM5315kEvvXch9FYw46SSn1F26wUKIGU5UH4A7pC6teD8HM1SbaGJ3
 LvG1FWH12uE/SEWWpn4fS1/ebTyzfopo4Yep9M0=
X-Google-Smtp-Source: ABdhPJxPFdoAK53KrDUJDvXZZBNItrxVRstFggJZqPSzN1hTf5QMiOJMiJirNLjAI0bMczN8kVmmcLMEGUTHnXYsKxk=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr29428750ybx.472.1651129489342; Thu, 28
 Apr 2022 00:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
 <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
 <20220408150202.yhn3qppqwm7wzmo3@maple.lan>
 <OSZPR01MB7050BE18BC9E8DA05C00F478EBF29@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <OSZPR01MB70504BD8347355EB51F7CCB8EBFD9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB70504BD8347355EB51F7CCB8EBFD9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Apr 2022 09:04:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2aHBxRJbOcXBGM7gjAqpErBAeaG3NmfgBTn4TNYscSgw@mail.gmail.com>
Message-ID: <CAK8P3a2aHBxRJbOcXBGM7gjAqpErBAeaG3NmfgBTn4TNYscSgw@mail.gmail.com>
To: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
X-Provags-ID: V03:K1:jBwaiwog8RG76PNgpwNWX/D09SdKA5E98Qzn17+mPno6WDT713+
 vHNtw6tvzcXpW43LNjwXqu81PkPRht1D0b4qUhbD1bhOe+Xfp8MO0klTBVuEP/2nvwVg3z4
 ytvW4c9GEPZqoWQLdfWRIUX2DAYFYWBPtyjqjW1HFoud0Tl5ea0bl/vOq/Jj5qM8FzPiWbD
 xs8z2uahNvkg9O+Nauj4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YilPR+nBFMY=:HhmL3cUqrL9T173oVbITvB
 lnTAE9pFqV+1KoGnv4xvRchUMlY2rq12QcoZsTpYnCxGvqaJE0HeJExCBx7ua/oiY4KmJlWEE
 xN/dU93L602O4v/tc8Us9r4Atgs1kUlZb/7Ty4Q6rXHxvI6N5ZWTP+q7jdhWv2lDY93LkI3wV
 Y+F8NQN+SDaQXTsjpwkWpgJb1F+PHdBAGskXsBcUDOmq8PudaQsMng/C8hVUb0/x8jBfTG3+C
 pOgW7rsJkZTPMzPrdT8cObeHd6f9PW42S97hU6cx7ZsaSqV7nZ9Z22PbRmP6u8/My3pUIiMtI
 ydoMoMOKZD/Wpq94KncYnARXH8nGh2lXKe31Cd1g+k7rpRGiaeY+N36gwWktm9ZGmonTl76kK
 wZKsUPlQ6HDkPJq6TCSO2qaUQLnHQIpoCoFJClPJo0G8UVT5S6uA96R7w+5R4enWkqfxAhO/D
 OGjtqQR5JlFvgE2q6ArnGzXQGKtVHju1hZD5G3dmzTgytATyhK/IVBrV1G12d0JDU6QDSWN1A
 nFKAChq3FSamN5cSsBH3NgBslzNtgjjcEC7u3qIgSbnrJxEWxAClHycV1XDCxuBIGeGTnTcQ+
 qAEDo2L9YMw4pZrQ08n7OY8vkNd7x93QvI/HsZmFjqPBh2AKk89iC186TvPxCTWl6ip8gd/Lh
 XBLjtf9nHMDwrlhf8YdUeltto6Lv/73OmIV4OHYR4WjU5yyPm2v/+GUGN+ciymSh+OSiQ3pTz
 qwAFNHu2AzeDNUdCSfamTX7HPCX2QyZRPW4OBw+CkzR+WpD9aAEENVTL932fL9MtGu4lgRv41
 nb3dHyhXz8f2gdY7FpkXMlJSOuqLb7iSSmAlcLUHyOOUL0jYhE=
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Apr 28, 2022 at 4:15 AM hasegawa-hitomi@fujitsu.com
 <hasegawa-hitomi@fujitsu.com> wrote: > > Hi Greg, Arnd, and Daniel, > > >
 I understand that it is not appropriate to hardcode c. > > How abo [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [212.227.126.135 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1njyCz-0001Fl-LC
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/1] soc: fujitsu: Add A64FX
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Jason Wessel <jason.wessel@windriver.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Travis <mike.travis@hpe.com>, SoC Team <soc@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>,
 Jiri Slaby <jirislaby@kernel.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Apr 28, 2022 at 4:15 AM hasegawa-hitomi@fujitsu.com
<hasegawa-hitomi@fujitsu.com> wrote:
>
> Hi Greg, Arnd, and Daniel,
>
> > I understand that it is not appropriate to hardcode c.
> > How about using __setup() to add a new kernel parameter and allow the admin
> > to specify the sysrq command when booting?
>
> I have received a lot of advice regarding sysrq, but after some consideration,
> I would like to change to calling panic() directly as in v1 instead of sysrq.
>
> If the administrator wants to request a diagnostic, I think they usually
> expect crash with NMI like x86 and take a dump the kernel. It's not common
> to handle diagnostic interrupts with sysrq now, so I don't think
> it's necessary to make this driver extensible at this time.

Ok, fair enough. Matching x86 behavior sounds like a reasonable outcome.
If we want to make this configurable in the future, that can still be done then,
and it should work the same across architectures but adding the logic
in nmi_panic() directly.

        Arnd


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
