Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273B1C1BDB
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  1 May 2020 19:36:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUZaa-000198-Dp
	for lists+kgdb-bugreport@lfdr.de; Fri, 01 May 2020 17:36:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jUZaZ-00018a-QM
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 17:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TA6stwlQtMs0s5sdi3+tZ1ygYla8dV/bmC8ohmequGA=; b=PfQYd+u6BKJBlHPrwrjAKFho/L
 yvcSQtcpVJegCGeBjyPQBrNrJZ8yXGR/+gTeMRWFQYQgkKALGoV2tA+v8zi9PO71xUJjRqXxE1cPn
 xilcp/FvVff49cPSJGf6hCxLKe1qkdwUMIdeIe/tEK80P6wuHghsVE937cFnF3klshOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TA6stwlQtMs0s5sdi3+tZ1ygYla8dV/bmC8ohmequGA=; b=ax9EjcAjXJCFxp8EZR510Ctsax
 MnrE3Fa3zibTIsRB9Gp/em0Zq46dSCzzKn+YJDjOcucbmvCKjk4scHZXOUc5HxtIPVikjqu9Wq+HW
 lSIAo8lP4AplZtX4cvC9htyIiOZ/DiAyfqVBv4vcRMixUFmVUOsD1APpgeLtondZz3YM=;
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUZaT-004k9v-Mt
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 17:36:35 +0000
Received: by mail-vs1-f65.google.com with SMTP id e10so4053428vsp.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 01 May 2020 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TA6stwlQtMs0s5sdi3+tZ1ygYla8dV/bmC8ohmequGA=;
 b=KBM/6NPcoPyp2XNp6JUEX0Xt3PKjJ4OeWDSYAI2ClnarZon9yxFPFl0VQ1Z9H+zyGX
 7H7FRh2pe/8P19+PEzHcCgj2mDQkmWTZTnHkastnytPBWT6e2Zv/spgFa23CPQY0iA4z
 tkPgdfzL0pxE3paW1H2UbOMPQjNB308rhBS6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TA6stwlQtMs0s5sdi3+tZ1ygYla8dV/bmC8ohmequGA=;
 b=RQ+oMwxSHLUxarWLMdJUK6ymmTZx/k0exQGTwpPqRgZ858Y/911hiEmc6eO8XwKVqL
 ig3Qis4hJz6FJIbbY/tLdT1IUvGn5HEiBwwvRpL7ws9L1k+i075ygXMADMYFtH+1Izef
 1QJJgA0vK4UpKPkuVM0x6W5n8aiR4AniIWuH7nNo6bkC7+Av7wbQYOhUZeSOr4GHJDrS
 m5lv4fn/HiODKLeOxfh3A8TM2eurASd/dp51rAgUSAxhsmGV/7385QphRVdeD0dK9NyT
 emhVN4pS6/YXtIe5ycZNxiCNiAs8Z6TpwB9Tow+9ZwHfHUchD/2VWQN2nzxlbqPh3FRH
 waKg==
X-Gm-Message-State: AGi0PuYxaVCB0ZZplB5GaHyUmXCAtBy8M0y7wR1oQq5DaqDcJaC3pVhU
 SKUrF0kxBcAB5/VjtbGuKkrVCa754xE=
X-Google-Smtp-Source: APiQypKCxsJhvYb9rrdQZj7VBWAIWOugFhUX/CEcpqBLKDvjoz0aWOsGaDqo0OjcJJyTi8Uz0m4Ppw==
X-Received: by 2002:a05:6102:3036:: with SMTP id
 v22mr4122564vsa.202.1588354587296; 
 Fri, 01 May 2020 10:36:27 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id z191sm929099vsz.32.2020.05.01.10.36.26
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 10:36:26 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id z16so3945944uae.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 01 May 2020 10:36:26 -0700 (PDT)
X-Received: by 2002:a9f:27ca:: with SMTP id b68mr3831812uab.8.1588354586095;
 Fri, 01 May 2020 10:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095819.1.Id37f71c69eb21747b9d9e2c7c242be130814b362@changeid>
 <20200501114943.ioetuxe24gi27bll@holly.lan>
 <20200501133202.GA2402281@wychelm.lan>
In-Reply-To: <20200501133202.GA2402281@wychelm.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 May 2020 10:36:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKKCkr1va9S+ygL7XuOvSm12-qw4dCSo=FBtyXx4JvhQ@mail.gmail.com>
Message-ID: <CAD=FV=WKKCkr1va9S+ygL7XuOvSm12-qw4dCSo=FBtyXx4JvhQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUZaT-004k9v-Mt
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: Be a bit more robust about
 handling earlycon leaving
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, May 1, 2020 at 6:32 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, May 01, 2020 at 12:49:43PM +0100, Daniel Thompson wrote:
> > On Thu, Apr 30, 2020 at 09:59:09AM -0700, Douglas Anderson wrote:
> > > The original implementation of kgdboc_earlycon included a comment
> > > about how it was impossible to get notified about the boot console
> > > going away without making changes to the Linux core.  Since folks
> > > often don't want to change the Linux core for kgdb's purposes, the
> > > kgdboc_earlycon implementation did a bit of polling to figure out when
> > > the boot console went away.
> > >
> > > It turns out, though, that it is possible to get notified about the
> > > boot console going away.  The solution is either clever or a hack
> > > depending on your viewpoint.  ...or, perhaps, a clever hack.  All we
> > > need to do is head-patch the "exit" routine of the boot console.  We
> > > know that "struct console" must be writable because it has a "next"
> > > pointer in it, so we can just put our own exit routine in, do our
> > > stuff, and then call back to the original.
> >
> > I think I'm in the hack camp on this one!
> >
> >
> > > This works great to get notified about the boot console going away.
> > > The (slight) problem is that in the context of the boot console's exit
> > > routine we can't call tty_find_polling_driver().
> >
> > I presume this is something to do with the tty_mutex?
> > > We solve this by
> > > kicking off some work on the system_wq when we get notified and this
> > > works pretty well.
> >
> > There are some problems with the workqueue approach.
>
> ... so did a couple of experiments to avoid the workqueue.
>
> It occured to me that, since we have interfered with deinit() then the
> console hasn't actually been uninitialized meaning we could still use it.
> This does exposes us to risks similar to keep_bootcon but in exchange
> there is no window where kgdb is broken (and no need to panic).
>
> My prototype is minimal but I did wonder about ripping out all the
> code to defend against removal of the earlycon and simply keep the
> earlycon around until a new kgdbio handler is installed.

It took me a little while, but I finally see what you're saying.
You're saying that we keep calling into the boot console even though
it's no longer in the list of consoles.  Then we temporarily disable
the boot console's exit routine until kgdb_earlycon() is done.  (side
note: the exit routine was recently added and probably most consoles
don't use it).

OK, that doesn't seem totally insane.  It actually works OK for you?

It's probably at least worth a warning in the log if we detect that
we're using the boot console and it's not in the console list anymore.
Then if kgdb starts misbehaving someone might have a clue.

If your solution is OK we might also want to remove the call to
cleanup_earlycon_if_invalid() in configure_kgdboc() too.

I think you might win the "hackiest solution" prize, but your solution
definitely does seem better because I can't think of any other good
way to handle people whose consoles register a long time before their
tty.  ;-)


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
