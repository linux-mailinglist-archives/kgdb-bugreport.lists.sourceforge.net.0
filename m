Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8402760BF9E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 02:33:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1on7t0-0004iN-Ms
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Oct 2022 00:33:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1on7sy-0004iH-UC
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SwjrQKeWuL/UTLvlOb5w0Oe0RoidZXir5S4vG79BLUw=; b=MWomNfZgFELD+JRDJdD+QIP0VA
 QeNU9gk0rVq0zIKFtGxB6liOLTJRPjx3AmidcM2MEepEshE0pigxqxiBPjs7V+Cp5h7+TyiyOMXEt
 do7Ya0Mn5OYiL8rilaQvHvxQ+jWapv9UhbYUAYZ/DmfcEdrw057uxcuDnHbOxuKVm1mk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SwjrQKeWuL/UTLvlOb5w0Oe0RoidZXir5S4vG79BLUw=; b=mQhvtcOHTEmXnItZ66ntTONXnv
 lW6Uo2qq8E+GbdzhCQNTRtWLMzT8GXZzewJT1oy9kJZv/HZAJliSUhBONpD8QLeYDuC0ERe6LrKyz
 7GNSXHcovM17FO6HzMHCk9k7hCSp3wToY2tbIzgYAepHi4gUV8SOo3NT5ZG0a05nSUDY=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on7su-0003Hs-7J for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:33:40 +0000
Received: by mail-ej1-f51.google.com with SMTP id bj12so8686438ejb.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SwjrQKeWuL/UTLvlOb5w0Oe0RoidZXir5S4vG79BLUw=;
 b=YZugDW7tObAfGv7/nl7dpBqM1o0NuLh7r/vtflD7JeJ1NM5xmB+ff2CqU4zkDJSYNk
 6JMgIHIw0iVHvEW4jiJj00OGLmvSa6ZQurr+pmhK/mlshehc8TpxfKJ4Jr+zQgQE0wKm
 MICKDbypklPHTCv8GzN6dFChYHG/NDT3w22XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SwjrQKeWuL/UTLvlOb5w0Oe0RoidZXir5S4vG79BLUw=;
 b=0DtuymNLyuvtiMj+tPcb7Nrb4xFpHEfA5uPRcHAaKjQ8R5omc3mQ1tVqJMVtyoWhhh
 vnptJnmdQSeO8iBQ3b3XEdn85S7x/ItMUbjQA4YyrtUSMyNJafr2mQJragYuBgc1cZWN
 6b9oloqGcMhBO+6DUOMvEXBzWX5gMwT0DW9paMuFIzcz9dPomFyEqxbUoFm80xt4vp2v
 vOXdwJ6EFoIrl34QCxe8DIxcr7fBzRxyDI8zVwvI0nVmsb5ncSE0x2RvvP8feLQt0HNJ
 7AIasgYVVZ2GeMvXuv8RjwsfpzZGv2R7OFWOqLqBlTDrmXm26D+NVRrjpvxXOtKuVwDv
 5uwA==
X-Gm-Message-State: ACrzQf3nGmm1XOMP1vdvArACiDrzKkBe8c5y5w6b7qkohCI7hAyRuoSZ
 z3iKZX8QlCLtebav7WnIh5DczS4aPdxUPBgd
X-Google-Smtp-Source: AMsMyM6bdQ172WGFQXyxG4xePRiAmrIYCmLNUm2GdLcOrrfvouygOBIuqJWXNoj7qg2iwC1jeHgVXg==
X-Received: by 2002:a17:906:7944:b0:73c:838:ac3d with SMTP id
 l4-20020a170906794400b0073c0838ac3dmr29699493ejo.242.1666658009483; 
 Mon, 24 Oct 2022 17:33:29 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 r18-20020a1709063d7200b0076ff600bf2csm551557ejf.63.2022.10.24.17.33.28
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 17:33:28 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id bs21so2592093wrb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:33:28 -0700 (PDT)
X-Received: by 2002:a5d:51cb:0:b0:236:6a62:4bc8 with SMTP id
 n11-20020a5d51cb000000b002366a624bc8mr7153865wrv.583.1666658008254; Mon, 24
 Oct 2022 17:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-22-john.ogness@linutronix.de> <Y1K2JP6LIf8H2Ub5@alley>
In-Reply-To: <Y1K2JP6LIf8H2Ub5@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Oct 2022 17:33:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VfgdY9qabAzOxu4Rs5UjCRCHMMh=zidX3oq25_tuQD-w@mail.gmail.com>
Message-ID: <CAD=FV=VfgdY9qabAzOxu4Rs5UjCRCHMMh=zidX3oq25_tuQD-w@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Oct 21,
 2022 at 8:09 AM Petr Mladek <pmladek@suse.com>
 wrote: > > On Wed 2022-10-19 17:01:43, John Ogness wrote: > > Use srcu console
 list iteration for safe console list traversal. > > > > No [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on7su-0003Hs-7J
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 21/38] serial: kgdboc: use
 srcu console list iterator
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Oct 21, 2022 at 8:09 AM Petr Mladek <pmladek@suse.com> wrote:
>
> On Wed 2022-10-19 17:01:43, John Ogness wrote:
> > Use srcu console list iteration for safe console list traversal.
> >
> > Note that configure_kgdboc() still requires the console_lock in
> > order to ensure that no console is in its write() callback when
> > its direct() callback is called. Add comments to clarify this.
>
> s/direct()/device()/
>
> Do you know about such requirements or is it just
> a conservative approach, please?
>
> I ask because the comment in the code says "may assume".
>
>
> Anyway, this would deserve a comment why the SRCU list iteration is
> needed even when console_lock() is needed as well.
>
> The reason is that further patches are going to synchronize
> console_list manipulation with another lock and console_lock()
> will be used only to serialize accessing con->write() callbacks.

I had the same concern. I'll note that at the end of the series the
documentation for console_lock() still says:

 * Acquires a lock which guarantees that the caller has
 * exclusive access to the console system.

That seems to imply (at least to me) that if you're holding
console_lock() there's no need to hold the SRCU lock.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
