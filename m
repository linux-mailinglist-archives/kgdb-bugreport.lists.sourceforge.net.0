Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F674F97EF
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Apr 2022 16:22:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ncpVl-0002GT-HB
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 Apr 2022 14:22:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <arnd@arndb.de>) id 1ncpVj-0002G7-ME
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 14:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BQzT3P6RYSKNw1efg20ycxE2OU+qNj45a1JDzvWikZ8=; b=BHCtCn38Nup00OsR7QYOk8jn8O
 jJudZ5YuhFmTIIR8Rtt40RO5aYZhguUPwM3u2P5fuCE08SrhPsSrtcwT9QeqdvAC9bmlsDxEh4EMc
 tiplNQVmwih1Q5EFfBrYFhzen0V1F85S31UFCSo90/dZYG1QqAMX6hHeodC6iNMC5xlA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BQzT3P6RYSKNw1efg20ycxE2OU+qNj45a1JDzvWikZ8=; b=L2R1pZjayaftXLMjls8AceB2hM
 +kQEiNdC5ktG8j/AV7HlMD4CJetj5Kwl81QVtvu22UeL3bVlDGmKnkkO+OmU10m3wt57ZfVaA/IB/
 PhLwvxpEIDpta17lMybZf7eUqzzhT3aIjRG0enzC+d6vT+7Php1Y7tHAX1SuYqra61hE=;
Received: from mout.kundenserver.de ([217.72.192.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncpVh-00027U-Ke
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 14:22:50 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBmI6-1noyUz0DnQ-00C94F for <kgdb-bugreport@lists.sourceforge.net>; Fri,
 08 Apr 2022 16:17:33 +0200
Received: by mail-wr1-f53.google.com with SMTP id b19so13044005wrh.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Apr 2022 07:17:32 -0700 (PDT)
X-Gm-Message-State: AOAM532+kAwFghRbxKIiVKZGmUhV0AtTVgTCvbkeJBYAOOdf3GXHThDw
 R7BZtnbTeaBaVxrDowDh5s22WNsdzd7nuGpGaug=
X-Google-Smtp-Source: ABdhPJyRvLylYLoRuY6841KYpUytqXI11HqBYxQTS325hyru8pYNuf4xphTlAZhMdkzDaG6t0dxOMOlKEQOVIRLpsBk=
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr14524137wrg.219.1649427452724; Fri, 08
 Apr 2022 07:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
In-Reply-To: <20220408133246.fyw5554lgli4olvg@maple.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Apr 2022 16:17:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
Message-ID: <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Provags-ID: V03:K1:l+Tunj5nnRx9bCGjJqm2RxLq9IELTU/624oLgcJHl2Ss4txqB/9
 XYTiWLwTdhMq8e6LlBByyY3eExBu3dqfERgAnEtNGQG30VJ72RgKCpe/95sopSwzp51117e
 ZPGHhY4XbjhA+q9ri0PxTa8A70Q3q+XhJcq7b8MFCQvjfD7m/m81ubiibucoAk7e6bubdpb
 JuachzdGcgSf9Yt3j8KfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3W4QVJYtIUg=:Er2FewaK0imS60ZSGCvJEH
 vg9RDc48lGeg51RIMOJ51bHJRYXXSCdjoJs7Jn7PZnbO+oVM0Q9fPuFWzEBf5oE19Uo/5+pIg
 uXTfIaBB5THBA3b0mRRYeswZRMHH0g2M9IgVEpt8rHkzsr2IoUsZrj4WP1y5X4xJD9sbkcLcn
 4RSGx5C8wRkX5HU1D3W6xQJXlOF3XdMFsT6jiQ2pGEX1NBe9NVisAWpAPb1VANKS83G19rA0H
 hWDj6ZigNBFwJIOT4bmVu/wKjQ5aE80QsSefgeoE1Kz0GZVxxioug3ratm8EK7nQXJtjmZljm
 CFtgZ7bACKXpSm6fRQRdMTaUhAhcqaG3jjGCUvPVCGNzPSRfqP4o5kcY6IBodeuffu5wCfk5T
 vk02RTx1DFhtAgPWoqn9PtFEeEqsdYeBnPG6K0vO9hHkDrPymI//B7Q/1lTTpsi2hpo7cvlcr
 LTpHhEQFTNlC3xtYdHVRwjw6NHDFJbK57AeMH4/7QDoTL9kJ/sr8GCkA812+G72SEwmHQdKO4
 VivLcw3d4XbZIoJEwu1V0DkSdHMUhIn8KPRAWENsvrDX3hLx/BEcPABH0uXCvrgE1Ee4NHplG
 5N8cw5IG1p6Xm0e+4YrJPqh461bQecurjja/NU9ZvQ3LctICuVi/Zsirn9KBCvKnupDiZutZK
 EEVqKKOBvzV3QbSc59BoUO8SSbj44yw0cNeMbFprQ2WJYTa5yO26NEvpGqkdhyc2gDK8=
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 8,
 2022 at 3:32 PM Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote: >
 > There is some prior art for this sort of feature [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [217.72.192.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [217.72.192.73 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ncpVh-00027U-Ke
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 kgdb-bugreport@lists.sourceforge.net, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
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

On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
>
> There is some prior art for this sort of feature. AFAICT SGI UV has a
> similar mechanism that can send an NMI-with-no-side-channel to the
> kernel. The corresponding driver offers a range of actions using a
> module parameter:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
>
> I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> it is just obfuscation. However it is certainly seems attractive to be
> able to reuse handle_sysrq() to provide a more powerful set of actions.

How about a module parameter that allows picking a sysrq character then?

        Arnd


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
