Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C4C4EDDAF
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Mar 2022 17:45:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nZwzH-0004uH-0R
	for lists+kgdb-bugreport@lfdr.de; Thu, 31 Mar 2022 15:45:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <arnd@arndb.de>) id 1nZwzF-0004uB-GD
 for kgdb-bugreport@lists.sourceforge.net; Thu, 31 Mar 2022 15:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ibQPp/03Ubx3modZA7sznJa2m7DZITxn3RElP64viso=; b=Y3f6aoLUjb3kuGsBzjDJfQzob5
 jnVrmj8i0xImrqgqo/wJbnOMWAeHpOM/XqOZlmBjJolfZUcGRBwUvRqTkn13IbIH4XVjxyObyNVX3
 23ReqLkZWqcMUezhaFAy4JLAlUEnhhULiBqleIFiMvkg5jBMLDqoLlZsUwxaUkx8/RX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ibQPp/03Ubx3modZA7sznJa2m7DZITxn3RElP64viso=; b=CdS0s+x+3MjY5/itfiz9sLPguw
 QiZM77Zr1I1OSvN8DnUXnm2iK+YzOVbLYXHh3II9SjPRM32Np+BeDT4YsGYi1j+q3lwF848IkqvOR
 DKamouLdTLoBA6qWfZozQyyavN+OVVtLlJ0ZqGVexSxTP+tDwU41fJyXfb27DP+JFM3E=;
Received: from mout.kundenserver.de ([212.227.126.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nZwz9-0003yt-HR
 for kgdb-bugreport@lists.sourceforge.net; Thu, 31 Mar 2022 15:45:24 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N2SXX-1o1Xey3z4R-013tM4 for <kgdb-bugreport@lists.sourceforge.net>; Thu, 31
 Mar 2022 17:45:11 +0200
Received: by mail-wr1-f53.google.com with SMTP id h4so294672wrc.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 31 Mar 2022 08:45:11 -0700 (PDT)
X-Gm-Message-State: AOAM533rArwONY5acWdWyxjLz0ds4ALAjcxHxnSBrbcUqAtbe9boWRDE
 b/ZsrXFt1MkhMYX3Odxl96uQs9jn2ZU1yrjGzG0=
X-Google-Smtp-Source: ABdhPJyINqj20BgrqMVql8P0dLX86b0MRGwI7ZaFK1fyvU3QQ0XJBE7cU28CP6wHHSEMpvM8IDEW2Jl0QfL2BRdivwU=
X-Received: by 2002:a5d:6505:0:b0:205:9a98:e184 with SMTP id
 x5-20020a5d6505000000b002059a98e184mr4338853wru.317.1648741511582; Thu, 31
 Mar 2022 08:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
In-Reply-To: <YkWVTEG5oFO82GPL@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 31 Mar 2022 17:44:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
Message-ID: <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Provags-ID: V03:K1:fyIGlwkwtny6G+XZq/oEkWfKJZ5M0rBKN6N2d3DDZyU5MERNtbQ
 1XrPzonrIjZbhIJspt9SIrxZzUX88XusVjbyvxcwkQ70eXkuxXLS5uMI2kqQPC9LsgEnDok
 timrWkV0en01SqCWpu0e7O7YIdvCTNQZz/ml7vGqDPNGMQsT3zFD1RZXj1bS8KMRsRW1QrU
 bedof8rXAVRarYwYGqFxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gSdPwXuyPms=:jYrt/Y0OlaxprikJCihe8r
 FSoMXWd+ByVQiSopScXnE8x8+4n/lfWO2Exbw5CbPTxgy5YlDx/Pz7iI3+xpHiKBWwZdx3k4t
 ZttwlUBuW2w6I7i3NDJI9oCJ+5jQiJELdMbAcTIa3ooVfOJJPKWfBYgqrq6tU/stv+GR2cvLy
 RxSXGDGM5WI91EDlAsXvs4L/v9Za0aDtP56s98ju5MU0mmNfU0zcMryl0co7sYgim1YuumSI+
 4oPP8XYPRFfqOd1k5juRpe9lzZc90fT8UYykJZvQR9jJ+ltwoRRdzS7SrnL9vAgaT2P1JTbpD
 5wKM9kbJi63cYFAImj2ECTC+4K9Wbf0tiHbl2lLaNwZH8zou/tR1Bf5gpSRbvWhUnLwQARhmk
 S8uyHaF+GvK3msgInpglRAE7ql2UNhfX41tBkiCdarSkcpYmswnEoCXoHTH3hfDj7aRManX1A
 o9BWp/qMVOM1152Vsw3sy3YWcwJbhxFfaJ92L7vuHMJ1Gp99RD8OS8JMnptryWc4BlU5Ix8lA
 rX0DxCj5GWOJnnk+Q8FKzRiqFXXHruJ2UuWRG6YUNUyFk2eLdPXG3xlcSBoLpRadOCKM15gwz
 TLEOUXmh+biK4N37dRv9fZ2eBCf3s+NHqsCw5rZiLglQHqz9tC5r77QBDxxCQ9NdQha/ONSGl
 uL6PSC7eP5vu6s6zkf0ONKQVoaYd6X0iTxBUdTHH8X1v6xMcioTSssO8NDky0t/23nM2WHb7T
 ExedD+HqgC85x2KNqji9/fYmtiDI0adpJCof88TRbCQpuqFZ2myuSwzbkzzWGgLN/0ABelNCX
 jPwvLlPxCChuRYMGkDaAeoIq1aDsknV0xfhjX3kQwtNEasy7v8=
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 31,
 2022 at 1:49 PM Greg KH <gregkh@linuxfoundation.org>
 wrote: > > + > > +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id)
 > > +{ > > + handle_sysrq('c'); > > > Why is this ca [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [212.227.126.131 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.227.126.131 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nZwz9-0003yt-HR
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

On Thu, Mar 31, 2022 at 1:49 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > +
> > +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id)
> > +{
> > +     handle_sysrq('c');
>
>
> Why is this calling this sysrq call?  From an interrupt?  Why?
>
> And you are hard-coding "c", are you sure?

This is an actual sysrq driver in the traditional sense, where you can send
a single interrupt to the machine from the outside over a side channel.

I suggested sysrq instead of just panic() to make it a bit more flexible.
Unfortunately there is no additional data, so it comes down to always
sending the same character.

It would be possible to make that character configurable with a module
parameter or something like that, but I'm not sure that is an improvement.
Maybe you have another idea for this.

> > +static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
> > +{
> > +     u32 mmsc;
> > +     const void __iomem *diag_status_reg_addr;
> > +
> > +     diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
> > +     mmsc = readl(diag_status_reg_addr);
> > +     if (mmsc & BMC_INTERRUPT_STATUS_MASK)
> > +             writel(BMC_INTERRUPT_STATUS_MASK, (void *)diag_status_reg_addr);
>
> No need to wait for the write to complete?
>
> You shouldn't have to cast diag_status_reg_addr, right?

I think the cast is needed because the declaration of
'diag_status_reg_addr' incorrectly
marks it as 'const'. However, this should still trigger a 'make C=1'
warning with sparse
because it is now missing the __iomem annotation.

The correct solution of course is to remove both the cast and the 'const'.

       Arnd


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
