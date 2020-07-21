Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DE5228A68
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jul 2020 23:13:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jxzZP-0002RK-DK
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Jul 2020 21:13:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jxzZO-0002RD-9R
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 21:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jJhbzVDa9nePxgAcv9hRGTSaFk2PPisZtuGmQbqXq4M=; b=aLXPiZu/o+0jH/LZz/yl7Y83tX
 2riwK4Y8xLyCtARWVqfIgbolNDwrt4PIuWrcCU9JybIE3nvUR3rm47SdCMyeCKk8fUpVqBQeuDsCT
 nHJcK3Se1WsrHSh01W8ysYJ9WnlIPsAgu29Hug8ymCbMw7QleY1cD700nBlSlwG1ENC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jJhbzVDa9nePxgAcv9hRGTSaFk2PPisZtuGmQbqXq4M=; b=fTE3UO753vr8P12uQbwABys0Dg
 IbS4p4T32lSkBrvOUUaDrYrj3u+0CAcuiAHlcg6R/eGepUHoovql3txvCuRZf9w+1tiEy76z1X2jc
 jG+I6ZTN4PX4xpTvEtJ96K8BLE2lx6jgZSwemvATZ126IGPZTtnwGvZW9OnnKz5BDCOI=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxzZM-00FcZ2-Kb
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 21:13:02 +0000
Received: by mail-pf1-f193.google.com with SMTP id a24so41312pfc.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Jul 2020 14:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJhbzVDa9nePxgAcv9hRGTSaFk2PPisZtuGmQbqXq4M=;
 b=G2NWfIyUsyvk7iqL8Y7G25VX3J5N1E5bZULjMHl9k6T+YkX8MSsjLfVSTNpw2Sl+Uo
 pMFA/3oH9PDppJbYTdVpPInv0V/MNW9w2iTGnWfnlyxIoH6x4b5KjFdpFDWwXK6TC0h/
 4qpnv+b2YuXE1frsbcWunmMf/5SVUx1/zTeTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJhbzVDa9nePxgAcv9hRGTSaFk2PPisZtuGmQbqXq4M=;
 b=K8KzePY7JCf3hSaAxjIiCekqZUleowBa72qIYHNYOy184OziMSHMp8l6RjhSqmwhNe
 hd1ZGyUzxZl0b9z08fSS3WttbEw2dmsBZkEfyqE7cue4KK8PPY6PxoyufYdkOAiWghAf
 PTifvw8E0BRR/Oo55n+ciyOkt6EcCW8OCOlPLGalxmck28KplHzNnx6YNeOzKBMIclaM
 NVtvJiJpr7CKCCRSGMB3alxBCBTYZuKiiSSSt5eAFZ5SOtqX+vtkBpiWCaOCWXS+VIMO
 YaE0vOULBw5LwgIdWKhSCe+hTKKpxdwQRBofccikenEOAKodEuZl0TB4mv3/PZs1yL2g
 33tg==
X-Gm-Message-State: AOAM533Ozpl59vbA02DQ3p0Qu1aA976oaajFoohk1DO9fie4nKuAO6IW
 deUj92JSJqVPOgDptWORfaudL63yzwE=
X-Google-Smtp-Source: ABdhPJxjsPCba5xuQMNLr3/tCoiTk1ivIdv3GuJnXRR+pK5v4VrYmN7r05dMKltJmipyxTC5RyPN4g==
X-Received: by 2002:a1f:32cf:: with SMTP id y198mr22190464vky.64.1595365499189; 
 Tue, 21 Jul 2020 14:04:59 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171])
 by smtp.gmail.com with ESMTPSA id k187sm3401535vkk.26.2020.07.21.14.04.57
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 14:04:58 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id g22so62876vke.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Jul 2020 14:04:57 -0700 (PDT)
X-Received: by 2002:a1f:4e81:: with SMTP id
 c123mr12718651vkb.100.1595365497257; 
 Tue, 21 Jul 2020 14:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
 <20200716151943.2167652-3-daniel.thompson@linaro.org>
 <CAD=FV=UDVjwy5=OiDCrMbn8o9N5GGMiG8JnL0j+9fy3m5Vf4Eg@mail.gmail.com>
 <20200720080759.tyq4rq4qxmkwdk2g@holly.lan>
In-Reply-To: <20200720080759.tyq4rq4qxmkwdk2g@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Jul 2020 14:04:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WotJFiMe+tXtov2bEy2avH+=u5mi=gYM4U3_2DUGvO6g@mail.gmail.com>
Message-ID: <CAD=FV=WotJFiMe+tXtov2bEy2avH+=u5mi=gYM4U3_2DUGvO6g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxzZM-00FcZ2-Kb
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/3] kgdb: Use the kprobe blocklist
 to limit single stepping
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
Cc: Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Jul 20, 2020 at 1:08 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Jul 17, 2020 at 03:39:51PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Jul 16, 2020 at 8:20 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > If we are running in a part of the kernel that dislikes breakpoint
> > > debugging then it is very unlikely to be safe to single step. Add
> > > some safety rails to prevent stepping through anything on the kprobe
> > > blocklist.
> > >
> > > As part of this kdb_ss() will no longer set the DOING_SS flags when it
> > > requests a step. This is safe because this flag is already redundant,
> > > returning KDB_CMD_SS is all that is needed to request a step (and this
> > > saves us from having to unset the flag if the safety check fails).
> > >
> > > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > ---
> > >  include/linux/kgdb.h        |  1 +
> > >  kernel/debug/debug_core.c   | 13 +++++++++++++
> > >  kernel/debug/gdbstub.c      | 10 +++++++++-
> > >  kernel/debug/kdb/kdb_bp.c   |  8 ++------
> > >  kernel/debug/kdb/kdb_main.c | 10 ++++++++--
> > >  5 files changed, 33 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > > index 7caba4604edc..aefe823998cb 100644
> > > --- a/include/linux/kgdb.h
> > > +++ b/include/linux/kgdb.h
> > > @@ -214,6 +214,7 @@ extern void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc);
> > >
> > >  /* Optional functions. */
> > >  extern int kgdb_validate_break_address(unsigned long addr);
> > > +extern int kgdb_validate_single_step_address(unsigned long addr);
> > >  extern int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt);
> > >  extern int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt);
> > >
> > > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > > index 133a361578dc..4b59bcc90c5d 100644
> > > --- a/kernel/debug/debug_core.c
> > > +++ b/kernel/debug/debug_core.c
> > > @@ -208,6 +208,19 @@ int __weak kgdb_validate_break_address(unsigned long addr)
> > >         return err;
> > >  }
> > >
> > > +int __weak kgdb_validate_single_step_address(unsigned long addr)
> > > +{
> > > +       /*
> > > +        * Disallow stepping when we are executing code that is marked
> > > +        * as unsuitable for breakpointing... stepping won't be safe
> > > +        * either!
> > > +        */
> > > +       if (kgdb_within_blocklist(addr))
> > > +               return -EINVAL;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  unsigned long __weak kgdb_arch_pc(int exception, struct pt_regs *regs)
> > >  {
> > >         return instruction_pointer(regs);
> > > diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> > > index 61774aec46b4..f1c88007cc2b 100644
> > > --- a/kernel/debug/gdbstub.c
> > > +++ b/kernel/debug/gdbstub.c
> > > @@ -1041,8 +1041,16 @@ int gdb_serial_stub(struct kgdb_state *ks)
> > >                         if (tmp == 0)
> > >                                 break;
> > >                         /* Fall through - on tmp < 0 */
> > > -               case 'c': /* Continue packet */
> > >                 case 's': /* Single step packet */
> > > +                       error = kgdb_validate_single_step_address(
> > > +                                       kgdb_arch_pc(ks->ex_vector,
> > > +                                                    ks->linux_regs));
> >
> > I'm a little confused.  Isn't this like saying "if
> > (i_am_standing_in_acid) dont_step_into_acid"?
>
> I describe it more as:
>
>     if (we_know_there_is_acid_nearby)
>         dont_step_forward
>
> It is possible we are currently stepping in acid but it is also possible
> (and reasonably likely) that we haven't stepped in it yet but will do so
> soon.
>
>
> > Specifically you're checking the _current_ PC to see if it's in the
> > blocklist, right?  ...but you've already (effectively) dropped into
> > the debugger at that location, so if it really was a problem wouldn't
> > we already be in trouble?
>
> The basic use case is where someone is stepping and we reach a PC that
> would be blocked for a breakpoint. This will typically be due (although
> I think it does generalize) to a function call and the safety rail will
> be reached after we have jumped to the blocked function but before we
> actually execute any instructions within it.
>
> Or putting it another way, there is no reason to worry if we start
> somewhere "safe" and start stepping towards something on the blocklist.
> We won't melt our shoes!

I guess I still don't totally get it.  So let's say we have:

void dont_trace_this(...)
{
  thing_not_to_trace_1();
  thing_not_to_trace_2();
  don_t_trace = this;
}
NOKPROBE_SYMBOL(dont_trace_this);

void trace_me()
{
  sing();
  dance();
  dont_trace_this();
  party();
}

So presumably the dont_trace_this() function is marked as
NOKPROBE_SYMBOL because it's called by the kprobe handling code or by
kgdb, right?  So if we had a breakpoint there then we'd just have
infinite recursion.  Thus we want to prevent putting breakpoints
anywhere in this function.  Even though dont_trace_this() is also
called from the trace_me() function it doesn't matter--we still can't
put breakpoints in it because it would cause problems with the
debugger.

Now, I guess the question is: why exactly do we need to prevent single
stepping in dont_trace_this().  In the case above where
dont_trace_this() is called from trace_me() it would actually be OK to
single step it, right?  ...unless this is on a CPU that doesn't have a
"single step mode" and has to implement stepping by breakpoints, of
course.

...but maybe I'm confused and there is a reason that we shouldn't
allow single stepping into dont_trace_this() when called from
trace_me().  If that is the case, I'm wondering why it's OK to step
and stop on the first instruction of the function but it's not OK to
step and stop through the other instructions in the function.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
