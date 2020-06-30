Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A2320F7E0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jun 2020 17:05:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqHpO-0005XD-Bh
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 15:05:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jqHpN-0005Wx-3l
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 15:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=poYoL3/cPKc6YhvMgtbNki5IwtSkTfG/5fz26J/b5EY=; b=WED5PxrfJW29jLdJY7r/TH10Lw
 PjHWuuI1dSeCeKfzUQjkZWjYluVhd8wg+v3y5uewPJ00Q0Au5Zh79FnR8KmpcNwR00FAA8U929mdE
 828HZb1bsH6CPfZBOM4kjugse9NlDMEZzj2C6uOWRXicRfkxRJWhKU3PY5nlk2hUy00k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=poYoL3/cPKc6YhvMgtbNki5IwtSkTfG/5fz26J/b5EY=; b=KVg4d2kujdrm+2QTA3/pEGPbcx
 mC1Dj86sBobv8M4s0O4xvCItBffYIkUEa0tRZjKGlpWAzg7R+2KJGmX4NhRJt7RjTgWQe2LevBj/t
 S8hW/jldomOIQ8eB+MDWXq7KYx1YbVkRP5K/z2FHjRFNqdfg1BXj1svII0n+MtPBoxvo=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqHpI-007Xge-Mv
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 15:05:41 +0000
Received: by mail-wr1-f65.google.com with SMTP id h5so20541562wrc.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jun 2020 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=poYoL3/cPKc6YhvMgtbNki5IwtSkTfG/5fz26J/b5EY=;
 b=QLZ0c6sYgoLXlJU/0+4TBPm+a52qjmwCWNqqBEQ7vybjlPlDjSvgYOYbAJRNF6yO4s
 hbacKvijQkCv4ZXUnBbmr3302V+UxFcstJot+CeLbAlFkVUZ5pP7O4zCh5yGjVC3hXIf
 8qkr7bRobTSPbFfwF2UUZgX97oFRINcsO1E/VPdW5isXuJ2I0d2ce1sDovbRoWE2tla9
 uJbPsCscMzT24iubhrW0p8g4t1T1Iwc3Iv6G8dNe+STQ+tqMi33AFYBBOUp00sRRbA1U
 a3rE4sH3yxy4r4FVEjIIDZ4aTquh7eMCiYSsbHeD/T65n0fCH9WW4DNuVWFpCTiQSNd+
 AEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=poYoL3/cPKc6YhvMgtbNki5IwtSkTfG/5fz26J/b5EY=;
 b=Qx+Wq9eaTKo58zf0I6e6gTE5DxwNmdV1kPdyMq5VE2PjP5FKCXxA6aSCdKlLUlxyNi
 UH3NcgGzlElgIN8lVit6dHnE8ulJXra8E1Y/S6xMKXOe9Mf+2bVPz/BnYsWi/SHXUv3J
 DKvA64gFkPaKY0C023OGoKb/evvJN5+ScEHgebljGhCj2A7bUNVCJuJoPODOoz97G1gb
 vKSgEqX56RgPzAS77TIJYoQJPc2RwrR+yI5pR37cAbKmfHk38AiQv5keG7JRytynN1WU
 zbU4nohAsK7IU5XKK6WfK7W0KihT88QT4w5vMMuGo7uXc592oc6ct+r0EX6k85GSJYqs
 EecA==
X-Gm-Message-State: AOAM533mfrfa8dh33R9vAwNBb8MWRavg0AoefcqYr6pqdgdxHcFlmGaQ
 MWBPMrjoY0wZ+8+U7A6llLCUdKh/+wI=
X-Google-Smtp-Source: ABdhPJxqMeRRkCyDXXkEXcH0waLw/3C6DKn+MmgX9gTvC0ivxHY7K1TyZL8YHtUW7murrlapa65Utw==
X-Received: by 2002:adf:8067:: with SMTP id 94mr21259012wrk.427.1593529530221; 
 Tue, 30 Jun 2020 08:05:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v66sm4045169wme.13.2020.06.30.08.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 08:05:29 -0700 (PDT)
Date: Tue, 30 Jun 2020 16:05:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200630150527.odqvmzmsddzty4zx@holly.lan>
References: <20200629171529.558003-1-daniel.thompson@linaro.org>
 <CAD=FV=W9rdEsO1jP-kg6OetXmZO+kC9LenZM=CdxjUvv8BEU4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=W9rdEsO1jP-kg6OetXmZO+kC9LenZM=CdxjUvv8BEU4g@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jqHpI-007Xge-Mv
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Resolve races during
 kgdb_io_register/unregister_module
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
Cc: kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 Patch Tracking <patches@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jun 29, 2020 at 02:03:52PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 29, 2020 at 10:15 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > Currently kgdb_register_callbacks() and kgdb_unregister_callbacks()
> > are called outside the scope of the kgdb_registration_lock. This
> > allows them to race with each other. This could do all sorts of crazy
> > things up to and including dbg_io_ops becoming NULL partway through the
> > execution of the kgdb trap handler (which isn't allowed and would be
> > fatal).
> >
> > Fix this by bringing the trap handler setup and teardown into the scope
> > of the registration lock.
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >  kernel/debug/debug_core.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > index 9e5934780f41..9799f2c6dc94 100644
> > --- a/kernel/debug/debug_core.c
> > +++ b/kernel/debug/debug_core.c
> > @@ -1117,9 +1117,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
> >
> >         dbg_io_ops = new_dbg_io_ops;
> >
> > -       spin_unlock(&kgdb_registration_lock);
> > -
> >         if (old_dbg_io_ops) {
> > +               spin_unlock(&kgdb_registration_lock);
> >                 old_dbg_io_ops->deinit();
> >                 return 0;
> >         }
> > @@ -1129,6 +1128,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
> >         /* Arm KGDB now. */
> >         kgdb_register_callbacks();
> >
> > +       spin_unlock(&kgdb_registration_lock);
> 
> From looking at code paths, I think this is illegal, isn't it?  You're
> now calling kgdb_register_callbacks() while holding a spinlock, but:
> 
> kgdb_register_callbacks()
> -> register_console()
> --> console_lock()
> ---> might_sleep()
> ----> <boom!>

Thanks.

I very nearly didn't press "Send" yesterday because I was worried I was
rushing it too much (in order to avoid forgetting it ;-) ). Should have
listened to myself!


> I'm a little curious about the exact race we're trying to solve.
> Calling unregister on an IO module before register even finished seems
> like an error on the caller, so I guess it would be calling register
> from a 2nd thread for a different IO module while the first thread was
> partway through unregistering?  Even that seems awfully sketchy since
> you're risking registering a 2nd IO ops while the first is still there
> and that's illegal enough that we do a pr_err() for it (though we
> don't crash), but let's say we're trying to solve that one.

I didn't follow all the possible paths. Utlimately the
(un)register_callbacks() functions use a flag variable without a lock
and that can interact in lots of different ways.

To be honest none are especially likely because the normal case is to
register once during boot and never unregister. However we can trigger
register/unregister from userspace so I think they can happen
in parallel.

Double unregister can lead to some especially nasty schedules...
although they still remain pretty unlikely since we need the double
unregister to coincide with a breakpoint:


kgdb_unregister_callbacks()	kgdb_unregister_callbacks()
  .				.	
  test flag			.
  set flag to 0			.
  .				test flag
  .				spin_lock()
*** kgdb trap ***		  .
  . paranoid dbg_io_ops check     .
  .				dbg_io_ops = NULL
  . stop other CPUs
  . try to use NULL dbg_io_ops


I have drawn the kgdb trap in the first column because otherwise things
get too wide but the trap could trigger on any CPU in the system and
provoke the problem.


> 
> Looking at it closely, I _think_ the only race in this case is if the
> one we're trying to unregister had a deinit() function and we going to
> replace it?  If it didn't have a deinit function:
> 
> cpu1 (unregister)                 cpu2 (register):
> -----------------                 ----------------------
> kgdb_unregister_callbacks()
>                                   spin_lock() <got>
> spin_lock() <blocked>
>                                   if (old_dbg_io_ops) <true>
>                                     if (has dinit) <false>
>                                       print error
>                                       spin_unlock()
>                                       return -EBUSY
> <finish unregister>
> 
> The above is fine and is the same thing that would happen if the
> whole register function ran before the unregister even started, right?
> 
> Also: if the unregister won the race that should also be fine.
> 
> So really the problem is this:
> 
> cpu1 (unregister)                 cpu2 (register):
> -----------------                 ----------------------
> kgdb_unregister_callbacks()
>                                   spin_lock() <got>
> spin_lock() <blocked>
>                                   if (old_dbg_io_ops) <true>
>                                     if (has dinit) <true>
>                                       print Replacing
>                                   init new IO ops
>                                   spin_unlock()
>                                   if (old_dbg_io_ops) <true>
>                                     finish deinit of old
>                                     return true
> WARN_ON() <hits and shouts!>
> dbg_io_ops = NULL
> spin_unlock()
> if (deinit) <true>
>   double-call to deinit of old
> 
> So in this case we'll hit a WARN_ON(), incorrectly unregister the new
> IO ops, and call deinit twice.

To be honest I was simply working on "it is racy" and "there's not a
good reason to allow that", especially as we start to develop tools to
bring races to the surfaces someone will yell at us about it sooner or
later ;-).

Of course, implementing it correctly would have been better...


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
