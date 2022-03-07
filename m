Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C14CFD2E
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Mar 2022 12:40:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRBj2-000250-MU
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Mar 2022 11:40:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumit.garg@linaro.org>) id 1nRBis-00024o-Ru
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Mar 2022 11:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PfDSGTII8OEq1qMEWbwlEjjVe6Gd0qQ3i7mpLlNovXo=; b=CKI8ILe/CurswfqbJQysERQgrt
 U0pwu1CQy607cIHWXEnyPsMJFU58dV+hskEP8AeP07NU1Nnx5cYg8soz9Gp0D7gMBMQwedSFGU8sW
 RILQXn0MZWLYGq84WfBFWFb4GUOf7S7kBhbTx8bVj5tVmvqS9097Q/O1mu1D+isIAvSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PfDSGTII8OEq1qMEWbwlEjjVe6Gd0qQ3i7mpLlNovXo=; b=CvGM1JGsaS70/r0NVPV51RSRFM
 f2/eHgL43OKNXsCohszoCKoO5N8Cu9VUkIy+709W4XWWvqIxQb6F6+1+d2Jgi4A8iU9QHddXmL/qQ
 4uyIpqWohFkRuyTGa7R72NP5cbQlyh4nIeUlKFUEIfe6AJy1MxL0Rx7n+PIZ/3pJ/1Ik=;
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nRBig-0007VN-DW
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Mar 2022 11:40:12 +0000
Received: by mail-ej1-f43.google.com with SMTP id kt27so31378067ejb.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Mar 2022 03:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PfDSGTII8OEq1qMEWbwlEjjVe6Gd0qQ3i7mpLlNovXo=;
 b=s6fHa1lvEZ+3Bh1MehfEE0HK2VfASVuaxT8SUp12QuE277aF8K2ybSSCjlQLOh6dJi
 6zpjHIwqMHH72jSXgtSQe2JtnejXCOauODmvOckPKVdOlqqp/Vq/CrgMeT5SJw6kS6BK
 ZsPglIRC5dj0Yt88BFUbW4EjjleYt8+jh83REiycP2I5e2xY/+ZmyvS75mTCoQQE5uYQ
 CArbxumWu4wcAdWMeCHljWrnasDzzlg8KtdX/1wPmtgkubTys0XMuhk8eIkc2S20PRVT
 sMIq8M2tKLu1pwsBS6LquT12mIPGWldhjYkSa6AmYa3Z6uB/hkjIgZ9yUH25RUYEoCcB
 Bk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PfDSGTII8OEq1qMEWbwlEjjVe6Gd0qQ3i7mpLlNovXo=;
 b=6uhDw+HAPvjVMOTUZxKKrvcTbMf12Lr1VPn5qF3XXReS9wlqhPC35UKisGvOgsobwh
 WR3tyk7tXqmsJpAsMgTZDo53I9hBQ2pCojSOqapgW2Y0KiyL8Lbpi+RnGdmLpcRAJhlD
 Y5eWJUIVijTSEmb5l3DXroDc321r24CUYN7XN2NtBBn5XfpP02iyGxk7EPlrozu0SuUX
 27+vJfUf5RqUiPT250LN4ixotbjRF033KxGx+wZggreK9gn9OnRTIfdROT9xN5aljdKh
 ygOlsIkD3Ndw6Q4Nhu0bHC+Ce21fvkb+PNffqnBu2wKX6zzkAMsBjexZy1mwy3ZyolE1
 0Dtw==
X-Gm-Message-State: AOAM533pzJAOUYKFrlIvd1kY/yl+cTm1zAPP1adx4uGU0IWmdONWwlmQ
 Tqb4Od0x1OOctqhINJguJIjV2hpcIjo1527BKv9u1Wti/z3ocg==
X-Google-Smtp-Source: ABdhPJwrz3os6eByp/EdpREzHyJ/tokDYc1QXytMUsDeDk0Qqfiy5D7kAKidVGdZ+pKK2v++O45kzV7d0Lmw+p4uxYg=
X-Received: by 2002:a05:6512:220c:b0:447:413d:f9a2 with SMTP id
 h12-20020a056512220c00b00447413df9a2mr7324231lfu.22.1646652734247; Mon, 07
 Mar 2022 03:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
 <20220304064324.331217-2-hasegawa-hitomi@fujitsu.com>
 <CAD=FV=Udf=MzyPa_o=vz=nc7ZVXBuuVNqw-VOSfrShuv0hN64Q@mail.gmail.com>
In-Reply-To: <CAD=FV=Udf=MzyPa_o=vz=nc7ZVXBuuVNqw-VOSfrShuv0hN64Q@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 7 Mar 2022 17:02:02 +0530
Message-ID: <CAFA6WYM77XTttu4H35PL7tkZxtBA8XaX23QW1UTBcESBE4V0fw@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Doug, On Fri, 4 Mar 2022 at 23:36,
 Doug Anderson <dianders@chromium.org>
 wrote: > > Hi, > > On Thu, Mar 3,
 2022 at 10:45 PM Hitomi Hasegawa > <hasegawa-hitomi@fujitsu.com>
 wrote: > > > > void __handle_sysrq [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nRBig-0007VN-DW
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/2] tty/sysrq: Make sysrq handler
 NMI aware
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
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

On Fri, 4 Mar 2022 at 23:36, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Mar 3, 2022 at 10:45 PM Hitomi Hasegawa
> <hasegawa-hitomi@fujitsu.com> wrote:
> >
> >  void __handle_sysrq(int key, bool check_mask)
> >  {
> >         const struct sysrq_key_op *op_p;
> > @@ -573,6 +606,10 @@ void __handle_sysrq(int key, bool check_mask)
> >         int orig_suppress_printk;
> >         int i;
> >
> > +       /* Skip sysrq handling if one already in progress */
> > +       if (sysrq_nmi_key != -1)
> > +               return;
>
> Should this give a warning?
>
> Also, can you remind me why this is safe if two CPUs both call
> handle_sysrq() at the same time? Can't both of them make it past this?
> That doesn't seem so great.
>
>
> > @@ -596,7 +633,13 @@ void __handle_sysrq(int key, bool check_mask)
> >                 if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
> >                         pr_info("%s\n", op_p->action_msg);
> >                         console_loglevel = orig_log_level;
> > -                       op_p->handler(key);
> > +
> > +                       if (in_nmi() && !op_p->nmi_safe) {
> > +                               sysrq_nmi_key = key;
> > +                               irq_work_queue(&sysrq_irq_work);
>
> It looks like irq_work_queue() returns false if it fails to queue.
> Maybe it's worth checking and setting "sysrq_nmi_key" back to -1 if it
> fails?

Thanks for your comments. I hope v4 here [1] addresses all of them.
Please have a look again.

[1] https://lkml.org/lkml/2022/3/7/1059

-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
