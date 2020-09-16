Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4D26CFAF
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Sep 2020 01:34:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kIgwl-0002pY-Az
	for lists+kgdb-bugreport@lfdr.de; Wed, 16 Sep 2020 23:34:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1kIgwj-0002pQ-Pt
 for kgdb-bugreport@lists.sourceforge.net; Wed, 16 Sep 2020 23:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oAxt7tGjPsSP/i9NumZB44TI87Eu2C4o0JiIlcf0j3w=; b=RvjwyWinb2Ws+gM1sAFqOptUaH
 n1M746yFzpSvPMvGoaM1h+3MKsC10VXp5NsKoJDBH9UzLPId6VWvK6TP6+p/ZzPbFxCN3JtT69bRN
 tV5QVIAor/hPeD++bFYWBerK6FyD5QQi3ehFf8yW7Yp8thHJZ+Cp80yPuge/dkE52h2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oAxt7tGjPsSP/i9NumZB44TI87Eu2C4o0JiIlcf0j3w=; b=AfFRKXLPPNqZrtufguoOJ/NKD7
 UT5j3J/Hz+dgmU06rvKhHQgufXfJAdU3041orpg3QtMcD2/Jt9xzX1/CECNQZAcH9Y5WoG58wggH9
 dNPKsZB7HQNXjBjwR6+adqNlCVpHmOY/PZW0AJeCAgK44+sJfdljquNDbq1sCc8JBJdw=;
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kIgwd-00C9l0-4f
 for kgdb-bugreport@lists.sourceforge.net; Wed, 16 Sep 2020 23:34:41 +0000
Received: by mail-ua1-f67.google.com with SMTP id n26so102610uao.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Sep 2020 16:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oAxt7tGjPsSP/i9NumZB44TI87Eu2C4o0JiIlcf0j3w=;
 b=L8Zov3lPD5usKoAj8++Yb2FGHzxOeeAQVMTum1D8Rw5LouUMDdLYO+mxgJMk9yUNaf
 fyQONwoBZhlMb0tTiDal+CU5Pfsks9L8KzY3DPChp5hq4YTFmYl+qM/AHhvwzwdG9zBZ
 a/9JCD8xpPvt7VTFGVScVYtyqGFjWyj2emKEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oAxt7tGjPsSP/i9NumZB44TI87Eu2C4o0JiIlcf0j3w=;
 b=SDSOuhMaiG66xEqRox3q94hWrENH/BII9FMRXr2oCLxpp+xJvTH3EGrO2y5pAqwHp4
 xwAaxyoyY+p1ZGkkIafW0FI4dsrtokJ8USiMD7jGu7rHuWUWCnK2PwQYZFRhc4TUJHg4
 VNWC1/zLBkllqqYWrPd7vEzMzzP3w44WX9rwzEamrwI2Ss1gHpPs9F0XF2wTv35Ns05E
 Niz2zcykATrpeez/fFnVn7/qkcq1w+WTE1lzKFPZO7ohZPTrHY/vi28FMh7i/iHJe5ei
 pTdoFOGmLEW19ag/QCps9MTx5fRdbHPEmHOZ0q8mZfti0hsDGCjMNodIJdm6xFSDy/+F
 1zFA==
X-Gm-Message-State: AOAM530k+O90LAwpb5a3f8m/Br/WJ/SGx5u0H9RHVaEnKLLDUeJgLwq1
 eE6fbbZbFi2cVT/GkQ4cIHzy0oHatfv3pw==
X-Google-Smtp-Source: ABdhPJwe0Ybt5F/gH+Muu5+ylkxZ1rhUlkdKSXxzOfjZNbrW4xpZIlSAWCwqRz5m0DDpjU6648dKAw==
X-Received: by 2002:ab0:77ce:: with SMTP id y14mr5530797uar.44.1600299268853; 
 Wed, 16 Sep 2020 16:34:28 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id n8sm3120344vkk.13.2020.09.16.16.34.27
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 16:34:27 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id t189so975vka.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Sep 2020 16:34:27 -0700 (PDT)
X-Received: by 2002:ac5:cced:: with SMTP id k13mr15504944vkn.7.1600299267130; 
 Wed, 16 Sep 2020 16:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200914130143.1322802-1-daniel.thompson@linaro.org>
 <20200914130143.1322802-4-daniel.thompson@linaro.org>
 <CAD=FV=VUPXdHoPaQg=Pp=bH-iORicO+1LjBZ0PNu0=SumC5tYw@mail.gmail.com>
 <20200915134520.jgbxallmksifrg2x@holly.lan>
In-Reply-To: <20200915134520.jgbxallmksifrg2x@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Sep 2020 16:34:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTH4B4Ysu+duDhQjMx1vFL1tE0qkzFh78BkrwLj7iB=Q@mail.gmail.com>
Message-ID: <CAD=FV=UTH4B4Ysu+duDhQjMx1vFL1tE0qkzFh78BkrwLj7iB=Q@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.67 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kIgwd-00C9l0-4f
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/3] kernel: debug: Centralize
 dbg_[de]activate_sw_breakpoints
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

On Tue, Sep 15, 2020 at 6:45 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Sep 14, 2020 at 05:13:28PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Sep 14, 2020 at 6:02 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > During debug trap execution we expect dbg_deactivate_sw_breakpoints()
> > > to be paired with an dbg_activate_sw_breakpoint(). Currently although
> > > the calls are paired correctly they are needlessly smeared across three
> > > different functions. Worse this also results in code to drive polled I/O
> > > being called with breakpoints activated which, in turn, needlessly
> > > increases the set of functions that will recursively trap if breakpointed.
> > >
> > > Fix this by moving the activation of breakpoints into the debug core.
> > >
> > > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > ---
> > >  kernel/debug/debug_core.c       | 2 ++
> > >  kernel/debug/gdbstub.c          | 1 -
> > >  kernel/debug/kdb/kdb_debugger.c | 2 --
> > >  3 files changed, 2 insertions(+), 3 deletions(-)
> >
> > I like the idea, but previously the kgdb_arch_handle_exception() was
> > always called after the SW breakpoints were activated.  Are you sure
> > it's OK to swap those two orders across all architectures?
>
> Pretty sure, yes.
>
> However, given the poor attention to detail I demonstrated in patch 2/3,
> I figure I'd better write out the full chain of reasoning if I want
> you to trust me ;-) .
>
> kgdb_arch_handle_exception() is already called frequently with
> breakpoints disabled since it is basically a fallback that is called
> whenever the architecture neutral parts of the gdb packet processing
> cannot cope.
>
> So your question becomes more specific: is it OK to swap orders when the
> architecture code is handling a (c)ontinue or (s)tep packet[1]?
>
> The reason the architecture neutral part cannot cope is because it
> because *if* gdb has been instructed that the PC must be changed before
> resuming then the architecture neutral code does not know how to effect
> this. In other words the call to kgdb_arch_handle_exception() will
> boil down to doing whatever the architecture equivalent of writing to
> linux_regs->pc actually is (or return an error).
>
> Updating the PC is safe whether or not breakpoints are deactivated
> and activating the breakpoints if the architecture code actually
> censors the resume is a bug (which we just fixed).

OK, fair enough.  Without digging into all the arch code, I was
assuming that some arch somewhere could be playing tricks on us.
After all, the arch code is told about all the breakpoints
(kgdb_arch_set_breakpoint) so, in theory, it could be doing something
funky (not applying the breakpoint until it sees the "continue" or
something?).

I guess the one thing that seems the most plausible that an
architecture might be doing is doing something special if it is told
to "continue" or "single step" an address that had a breakpoint on it.
I guess I could imagine that on some architectures this might require
special handling (could it be somehow illegal to run the CPU in step
mode over a breakpoint instruction?).  ...or maybe if it was using
hardware breakpoints those don't trigger properly if you're continuing
to the address of the breakpoint?  I'm making stuff up here and
presumably none of this is true, but it's what I was worried about.

From a quick glance, I don't _think_ anyone is doing this.  Presumably
today they'd either need a) a funky implementation for
kgdb_arch_set_breakpoint() or they'd need b) code somewhere which read
memory and looked for "gdb_bpt_instr".

a) Looking at kgdb_arch_set_breakpoint(), I don't see anything too
funky.  They all look like nearly the same code of writing the
breakpoint to memory, perhaps taking into account locked .text space
by using a special patch routine.

b) Looking at users of "gdb_bpt_instr" I do see some funkiness in
"h8300" and "microblaze", but nothing that looks like it fits the bill
of what we're looking for.

In any case, even if someone was doing something funky, it would be
possible to adapt the code to the new way of the world.  You'd just
check the PC when applying breakpoints rather than checking the
breakpoints when continuing.  So I'm going to go ahead and say:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and I guess if it really truly causes problems for someone we'll
figure it out.


Feel free to ignore the below.  I wrote it up but realized it probably
wasn't useful but couldn't bear to delete it.  :-P

One somewhat plausible example (I don't think this happens, so feel
free to let your eyes glaze over and ignore).  Assume that the kernel
has a mix of ARM and Thumb code.  When told to set a breakpoint at an
address the kernel wouldn't know whether the address refers to ARM or
Thumb code.  In the past I've solved this type of problem by using an
instruction as a breakpoint that is an illegal instruction when
interpreted any which way (the instruction is illegal as an ARM
instruction and both halves illegal as a Thumb instruction).  Right
when we're about to continue, though, we actually have extra
information about the PC we're going to continue to.  If we know we're
about to continue in Thumb mode and the address we're going to
continue on is the 2nd half of a breakpoint instruction we suddenly
know that the breakpoint should have been a Thumb-mode instruction and
we could fix it up.

AKA:

1. kernel is asked to set a breakpoint at 0x12340000.  We don't know
if this is arm or thumb so we set a 32-bit (ARM) breakpoint at
0x12340000

2. We're told to continue in thumb mode at address 0x12340002

3. We suddenly know that the breakpoint at 0x12340000 should have been
a 16-bit (Thumb) breakpoint, not a 32-bit (ARM) breakpoint, so we
could fix it up before continuing.

OK, that probably was just confusing, and, like I said, I don't think
kdb in Linux does that.  ;-)

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
