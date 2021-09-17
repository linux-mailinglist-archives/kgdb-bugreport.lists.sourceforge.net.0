Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EC340F3F1
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Sep 2021 10:18:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mR94p-0002uu-2a
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Sep 2021 08:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1mR94n-0002uU-FX
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Sep 2021 08:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+EBxk48D2Ri39ajK9sHFGOT1FXUJjXNGWwxV16s2SjI=; b=e5ZSKrhrSGQlC/u+1s6zPIrfQ1
 a0VBS/y63nNBK2GbB1oBbqIpOa8qu0g3kCkmknCbkg0Z+dF4eRPfQY8iBIn6jiuOKifEMjJ1l50hy
 wEtOVuvxoOQyrcQjt6JY0aFYzNErPy9+aylWOvt2OwavsWYb606A2tqRSKTKqWrk6yrk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+EBxk48D2Ri39ajK9sHFGOT1FXUJjXNGWwxV16s2SjI=; b=ha11ZI9S7ME4A14tXBqJxYnl4j
 0eSjB8r6b7b5leaPXO43gf+nPV/puEKy2KWoQ77h2pOcJg8V73X/dI6lu4g3l5p64Co+H4jeR/f39
 lKW+JTvkFlajhHsJir0GXYYlHLU1m6W5HAL276S153bu0wHE6sgG5USt9xymaPgaHGBk=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mR94j-0000Lk-6S
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Sep 2021 08:18:29 +0000
Received: by mail-wr1-f54.google.com with SMTP id u15so13771022wru.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Sep 2021 01:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+EBxk48D2Ri39ajK9sHFGOT1FXUJjXNGWwxV16s2SjI=;
 b=Hrv+P7lmpHE0m2T8u2gh057X/ZLS4E7VSZNGXccENgj/N7Uxh11gCyN0lGU3oNhHxe
 +XTIXz/CyI56g3MW2Y7mpIGKcOE8Alpy0OC6f6z+O+RNY+GH+jhKS71yws1V2tGKd2XC
 33TsdEARtBKBXszG8D5z2rGTwQKU2xcfvCAEpg52oAgwRXUs7FG2JzZltoAKXu1tJ/36
 /p8Y9AE/xdjBzDHThA9q/79J+29I4NMyhGX+74SmB8DACGGrOEUBkn8PJdtaWo6i20YQ
 sVZm6yCqvRkVh5cnSomMq6GMBUCRR8jJToIepYDslIotXjdj6HlMC/VK2lQH2AU6Sl5m
 nifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+EBxk48D2Ri39ajK9sHFGOT1FXUJjXNGWwxV16s2SjI=;
 b=K7sGJ+GStvC9dVM0JUj8R72XJWFFeFqqITc6LVHF2KPkJHYDtcdo9Wx7waYCZ2T8bz
 pkxpgsAsajxaFyH09ebrp5zbUW33huAJy8udph1+W0iJCfbO9rg3JX7MUxxjgX13rNQn
 6P7aKiWwoC+Knk8GAy1zHtkESyby2cizD3qXpXjwjgooA7aGJ2v1kOPWvAj1hUSPEryh
 NMUm+bsHP5cFxtAP/TJa/25CrebK7OxLrl7ZKY9Gnatvo6j9cBsyA30Qmf9CFqoYs3de
 0ek06ECYA9XTFBU5glxPRgFKNr/6nSkntM7b8570h92lKm7b50+mS2VMcyXOKmxHB62D
 jJPw==
X-Gm-Message-State: AOAM533MIdxYs8GQTRa1JqhFGQKaWxsRJFgk9A/7RQMEzybxGdPdBngX
 K86BDsPH2j0RbgLA2ISY1UymfxLbRw8c2yba
X-Google-Smtp-Source: ABdhPJzw2bpggPBJCppZg2Y1vp0YqGgFpDYA9U0vmBJeddmUbIU6OoaSWRLKxa/DK4Lg1oi/oWwrzQ==
X-Received: by 2002:a5d:5351:: with SMTP id t17mr10685224wrv.405.1631866698733; 
 Fri, 17 Sep 2021 01:18:18 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id v21sm781664wrv.3.2021.09.17.01.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 01:18:18 -0700 (PDT)
Date: Fri, 17 Sep 2021 09:18:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20210917081816.kkyvqbdptnyke5jp@maple.lan>
References: <20210916154253.2731609-1-daniel.thompson@linaro.org>
 <CAD=FV=Xri+J2=iQzCHLxB+ksT41V6Rexp+BXWi6Fe7=jq3oTFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xri+J2=iQzCHLxB+ksT41V6Rexp+BXWi6Fe7=jq3oTFg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 16, 2021 at 09:28:22AM -0700,
 Doug Anderson wrote: > Hi, > > On Thu, Sep 16,
 2021 at 8:43 AM Daniel Thompson > <daniel.thompson@linaro.org>
 wrote: > > > > Currently kdb contains some open- [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.54 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mR94j-0000Lk-6S
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Adopt scheduler's task
 clasification
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>,
 jing yangyang <jing.yangyang@zte.com.cn>, kgdb-bugreport@lists.sourceforge.net,
 Patch Tracking <patches@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Sep 16, 2021 at 09:28:22AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Sep 16, 2021 at 8:43 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > Currently kdb contains some open-coded routines to generate a summary
> > character for each task. This code currently issues warnings, is
> > almost certainly broken and won't make any sense to any kernel dev who
> > has ever used /proc to examine tasks (D means uninterruptible?).
> >
> > Fix both the warning and the potential for confusion but adopting the
> > scheduler's task clasification. Whilst doing this we also simplify the
> 
> s/clasification/classification/
> [...]
> s/scheudler/scheduler/
> [...]
> s/entirity/entirety/

Will do. Thanks.


> > characters, we need to keep I as a means to identify idle CPUs rather than
> > system daemons that don't contribute to the load average! Naturally there
> > is quite a large comment discussing this.
> 
> I'm a bit curious why we're OK with changing other characters but not
> 'I'. Even if the scheduler use of the character 'I' is a bit
> confusing, it still seems like it might be nice to match it just to
> avoid confusion. Couldn't we use lowercase 'i' for idle CPUs?
> Alternatively beef up the commit message justifying why exactly we
> need to keep 'I' as-is.

I've been though a couple of iterations and nothing felt 100% right
(to the extent I should probably have marked the patch RFC).

There is another thing I left for a later patch... and that is that
the logic to hide sleeping kernel threads (called system daemons
in the comments) is also rather broken at present since, in the modern
kernel, the majority of sleeping system deamons today tend to be doing
uninterruptible sleeps (and many are marked no load and are reported
as idle). That means that the S -> M translation needs to change since
the way it hides processes is too unpredictable. I think it needs to
become an S -> s, D -> d and, if we keep I, I -> i.

Or, putting it another way, once we fix the S -> M translations, then
finding a character that implies idle and does not collide with the
existing set is very hard.

Perhaps '-' might be a good way to mark idle tasks? It's different that
the not-really-a-task nature of idle tasks might be obvious.

Let me take a second look!


> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Worth having a "Fixes" for the patch that introduced the warning?

I'm never sure how useful Fixes: that point to the dawn of time
actually are.


> > @@ -74,7 +74,7 @@ static void kdb_show_stack(struct task_struct *p, void *addr)
> >   */
> >
> >  static int
> > -kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
> > +kdb_bt1(struct task_struct *p, const char *mask, bool btaprompt)
> 
> In the comment above this function there is still a reference to
> "DRSTCZEUIMA". Update that?

We spotted. I'm inclined to change this and the one for ps to
<filter> and not attempt to maintain a list of valid characters.


> > @@ -2300,7 +2298,7 @@ void kdb_ps_suppressed(void)
> >  /*
> >   * kdb_ps - This function implements the 'ps' command which shows a
> >   *     list of the active processes.
> > - *             ps [DRSTCZEUIMA]   All processes, optionally filtered by state
> > + *             ps [RSDTtXZPIMA]   All processes, optionally filtered by state
> 
> What about "U"? What about "E"?

As above... keeping these comments maintained seems a little pointless.
I'll switch this to filter.
> 
> 
> > @@ -2742,7 +2741,7 @@ static kdbtab_t maintab[] = {
> >         },
> >         {       .name = "bta",
> >                 .func = kdb_bt,
> > -               .usage = "[D|R|S|T|C|Z|E|U|I|M|A]",
> > +               .usage = "[R|S|D|T|t|X|Z|P|I|M|A]",
> 
> What about "U"? What about "E"?

I might even consider <filter> here (and a few extra hints). The output
of ps (or ps A) is a much more useful way to figure out the interesting
tasks to filter.


> > @@ -559,7 +484,6 @@ unsigned long kdb_task_state_string(const char *s)
> >   */
> >  char kdb_task_state_char (const struct task_struct *p)
> >  {
> > -       unsigned int p_state;
> >         unsigned long tmp;
> >         char state;
> >         int cpu;
> > @@ -568,16 +492,20 @@ char kdb_task_state_char (const struct task_struct *p)
> >             copy_from_kernel_nofault(&tmp, (char *)p, sizeof(unsigned long)))
> >                 return 'E';
> >
> > -       cpu = kdb_process_cpu(p);
> 
> Don't you still need this? You still have the `cpu` variable and you
> still use it in the idle task case.

Not sure what happened here. I have to assume fat fingers post testing
since I tested the code paths to recognise idle threads before posting.


> > -       p_state = READ_ONCE(p->__state);
> > -       state = (p_state == 0) ? 'R' :
> > -               (p_state < 0) ? 'U' :
> > -               (p_state & TASK_UNINTERRUPTIBLE) ? 'D' :
> > -               (p_state & TASK_STOPPED) ? 'T' :
> > -               (p_state & TASK_TRACED) ? 'C' :
> > -               (p->exit_state & EXIT_ZOMBIE) ? 'Z' :
> > -               (p->exit_state & EXIT_DEAD) ? 'E' :
> > -               (p_state & TASK_INTERRUPTIBLE) ? 'S' : '?';
> > +       state = task_state_to_char((struct task_struct *) p);
> 
> Casting away constness is fine for now and likely makes this easier to
> land, but maybe you can send a patch up to change the API to have
> "const" in it?

I already have the patch written but I'd like to keep it decoupled from
the this one due to the warning fix aspect (I'll note in header).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
