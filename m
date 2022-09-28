Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C60515EEA64
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Sep 2022 02:01:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1odgzQ-00005x-Ii
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 29 Sep 2022 00:01:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1odgzP-00005q-Ck
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 29 Sep 2022 00:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uF9IrSBXhJ+NafdWEMQpitf+4MrXaPHD4le+kTGx+O4=; b=bC4dHjvmMnqmiqh8MKZ6szs+O5
 VSpScJed6t/5iNOUTkfCJOPObz9AQDwMc0koVBb9ew3lZaVLK69Y4pqZ1KPxO8/FjpUJOUo1BGb9s
 Op8qkTZwr6jIYEvOlxgVFl43lkUjXh/j1BNAlPgAqKNbeJv6VQ9KkAz/xFYHc5q/9zZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uF9IrSBXhJ+NafdWEMQpitf+4MrXaPHD4le+kTGx+O4=; b=DTN0xVwuLvkDz6j6aiq6XWC8gJ
 snA5SW8X3TA5R+eXF3XeA7b0AmKX9YLjvcQvmqzui3MNJZNBoM6ApVuFr8MFJ/lfqTa7U4BhXYdrm
 X6iFWVUNRn9h9TK6AkMp/AWjxYuhuFvCE6I/icc8uhrDnH2fxqrtpll/j87iy/1AfSsc=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1odgzL-0062DE-FI for kgdb-bugreport@lists.sourceforge.net;
 Thu, 29 Sep 2022 00:01:19 +0000
Received: by mail-ed1-f44.google.com with SMTP id x92so6140529ede.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 28 Sep 2022 17:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=uF9IrSBXhJ+NafdWEMQpitf+4MrXaPHD4le+kTGx+O4=;
 b=k/egANteamWGvHzZM6mSJU1J5xWS4JtZDELXcUYdNowutMFA1UGF/zdvxudAvPaQjE
 rIL3SCaxtxnYeK5c3aFB85eyNiwCBjCMjCE3iFvwyGzUxqznkaept8L4E3FW+/MbfoKA
 U4oH7wwnSNsLQ8/UgPcwe2Ww31SwjsY9bpQRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=uF9IrSBXhJ+NafdWEMQpitf+4MrXaPHD4le+kTGx+O4=;
 b=Gdc4gcoW4kgSZFEmeTMwDQLIBOTjxyUXzv90UPsH9+C0Wxw22nVgkqjTsQ4kkbIXfR
 /AsPzzfSvVFLa2cTs4McsNsIbvESf5xngh8hJJIrfMrU+kxak8cdb8wlhupqfmGkbY3u
 /wLJT2VjaRnLOEOZUxIb4xpfe+AZH90A4MUeGvcKDmLmOrKP1znFrSPWxISDiw6SJuot
 SIm7+Flou6GT+r4hGQ/yzCTxPP+snCJIj098FO3+f83cfXM8Hy6AuTecYoDmYavjCjjz
 RhnqWq8/oyE6KXjwON3D9s1PB7730cjgK6iV56dzKWK3ceCXa8cj9yR8LZU7MZICOXU3
 VdTQ==
X-Gm-Message-State: ACrzQf2d6cMC3N6S0nB8AXLe58XwxdEskpZjHh0yl/xXIqJmgKsKbJaJ
 UashWp0G8QXAQxUoYIfgrW6a8K3eKFyW4veh
X-Google-Smtp-Source: AMsMyM59A2hQ1xUJ/YwxZOl/n0ljtEFRPDJx4WI2p2L9qUedr1zsu3QQ85BCkdKYYqycLvDjKMwPdg==
X-Received: by 2002:a17:907:94d0:b0:783:8d4b:2b0c with SMTP id
 dn16-20020a17090794d000b007838d4b2b0cmr248258ejc.629.1664407947861; 
 Wed, 28 Sep 2022 16:32:27 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906308200b0073d70df6e56sm3050374ejv.138.2022.09.28.16.32.26
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 16:32:26 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso2242059wmk.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 28 Sep 2022 16:32:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1e18:b0:3b3:b9f8:2186 with SMTP id
 ay24-20020a05600c1e1800b003b3b9f82186mr255936wmb.151.1664407946407; Wed, 28
 Sep 2022 16:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
 <20220924000454.3319186-11-john.ogness@linutronix.de>
In-Reply-To: <20220924000454.3319186-11-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Sep 2022 16:32:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U3m_mVLpWna3pgi4=b7OCzUxmKh666g62zPNaB+6QHUA@mail.gmail.com>
Message-ID: <CAD=FV=U3m_mVLpWna3pgi4=b7OCzUxmKh666g62zPNaB+6QHUA@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Sep 23,
 2022 at 5:05 PM John Ogness <john.ogness@linutronix.de>
 wrote: > > From: Thomas Gleixner <tglx@linutronix.de> > > Provide a special
 list iterator macro for KGDB to allow unprotected li [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.44 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odgzL-0062DE-FI
Subject: Re: [Kgdb-bugreport] [PATCH printk 10/18] kgbd: Pretend that
 console list walk is safe
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Aaron Tomlin <atomlin@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Sep 23, 2022 at 5:05 PM John Ogness <john.ogness@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Provide a special list iterator macro for KGDB to allow unprotected list
> walks and add a few comments to explain the hope based approach.
>
> Preperatory change for changing the console list to hlist and adding

s/Preperatory/Preparatory

> lockdep asserts to regular list walks.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/tty/serial/kgdboc.c |  5 ++++-
>  include/linux/console.h     | 10 ++++++++++
>  kernel/debug/kdb/kdb_io.c   |  7 ++++++-
>  3 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index af2aa76bae15..57a5fd27dffe 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -462,10 +462,13 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>          * we have no other choice so we keep using it.  Since not all
>          * serial drivers might be OK with this, print a warning once per
>          * boot if we detect this case.
> +        *
> +        * Pretend that walking the console list is safe...

To be fair, this is not quite as unsafe as your comment makes it
sound. kgdb is a "stop the world" debugger and when this function is
executing then all of the other CPUs in the system should have been
rounded up and idle (or, perhaps, busy looping). Essentially as long
as console list manipulation is always made in a way that each
instruction keeps the list in a reasonable state then what kgdb is
doing is actually "safe". Said another way: we could drop into the
debugger at any point when a task is manipulating the console list,
but once we're in the debugger and are executing the "pre_exp_handler"
then all the other CPUs have been frozen in time.


>          */
> -       for_each_console(con)
> +       for_each_console_kgdb(con) {
>                 if (con == kgdboc_earlycon_io_ops.cons)
>                         return;
> +       }
>
>         already_warned = true;
>         pr_warn("kgdboc_earlycon is still using bootconsole\n");
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 24344f9b0bc1..86a6125512b9 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -187,6 +187,16 @@ extern void console_list_unlock(void) __releases(console_mutex);
>  #define for_each_console(con)                                          \
>         for (con = console_drivers; con != NULL; con = con->next)
>
> +/**
> + * for_each_console_kgdb() - Iterator over registered consoles for KGDB
> + * @con:       struct console pointer used as loop cursor
> + *
> + * Has no serialization requirements and KGDB pretends that this is safe.
> + * Don't use outside of the KGDB fairy tale land!
> + */
> +#define for_each_console_kgdb(con)                                     \
> +       for (con = console_drivers; con != NULL; con = con->next)
> +
>  extern int console_set_on_cmdline;
>  extern struct console *early_console;
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 67d3c48a1522..fb3775e61a3b 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -558,7 +558,12 @@ static void kdb_msg_write(const char *msg, int msg_len)
>                 cp++;
>         }
>
> -       for_each_console(c) {
> +       /*
> +        * This is a completely unprotected list walk designed by the
> +        * wishful thinking department. See the oops_in_progress comment
> +        * below - especially the encourage section...

The reality is also a little less dire here than the comment suggests.
IMO this is actually not the same as the "oops_in_progress" case that
the comment refers to.

Specifically, the "oops_in_progress" is referring to the fact that
it's not uncommon to drop into the debugger when a serial driver (the
same one you're using for kgdb) is holding its lock. Possibly it's
printing something to the tty running on the UART dumping stuff out
from the kernel's console. That's not great and I won't pretend that
the kgdb design is amazing here, but...

Just like above, I don't feel like iterating through the console list
here without holding the lock is necessarily unsafe. Just like above,
all the rest of the CPUs in the system are in a holding pattern and
aren't actively executing any code. While we may have interrupted them
at any given instruction, they won't execute any more instruction
until we leave kgdb and resume running.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
