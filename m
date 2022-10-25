Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901E60CAE7
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 13:28:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1onI6r-0000PD-6g
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Oct 2022 11:28:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1onI6m-0000P6-E3
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 11:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j00FzWp2DyoqTFDqRk0YLSglffeF01Js6+w7bEZmwNM=; b=at0T3f3iU736eTftcMSe1wmkG2
 DTVNI9LrFuT6vsQm6S7d385Mw0rtqLhpLDZSMK2uYttE+hYJXHFSiLcI2XEJUgyhnj3JRA2MtkXni
 kbwyp54jGa6rYY1hyrvwVlQl2jkEgVBDMnUZ/p1qrBuraseOKl4D77nwyQx5IP0J0GJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j00FzWp2DyoqTFDqRk0YLSglffeF01Js6+w7bEZmwNM=; b=VB+WRi6xo1gpLw6D/BYjIHzk2T
 NnlRRgCSvW7bYEPvLK9ahuHzov1Qo4ZKQmaTuNKKoS8veuxyAQfE5K3atVDY2yCTbkluPrtGha/oQ
 JoA+oqmrkFUUFr9zs7wyJyHGd8zB2ZDYg6WFGFfy5J+67y7T33MZeoRUQhxwXA76nXbc=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onI6Z-0007lw-S5 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 11:28:26 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1666697293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j00FzWp2DyoqTFDqRk0YLSglffeF01Js6+w7bEZmwNM=;
 b=l71XfcAhxqUMYyLb6J5362OAWgdW/zU2metRCyQUk7jOeuO+qmyxwZk/2zhBXKftgtJ9c/
 bRHczdniYcmsyegXhM13t92O8y72FeWj8VD8myypiPI37cst1nwyc1m0zTmjxnu24/pkS6
 bSEvn3tUTVhTEAkpk6tQUDNjG+aLUgwyF6tyy1yjWJrUnyxzr75UWrgeb3tU33jgUb9us4
 1ClP9zuZmBDOuuNaqILy3vDM8Xm+f23jPY8yrOQrl9wAEzfc5MWHF4gShl5wbP8vz4/Yw3
 fddhFgaYlJ6GrKyVFzci65mSr3QctPaX0hsbHzsWynLNuPjyih5X13S+Y8Bh0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1666697293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j00FzWp2DyoqTFDqRk0YLSglffeF01Js6+w7bEZmwNM=;
 b=5Z7hvJgeW/8IOsZH9zCVaPGCmsM2TtwRxk3HhpkgSGk1Tg9j/Fsmj079UEvOlSz4baTZa7
 Kjm45zFlSoDy59Dg==
To: Doug Anderson <dianders@chromium.org>
In-Reply-To: <CAD=FV=WF2S9wQ6uR+VKU4EfDTVd0JnKkuU3Wyfo6P8E_FouebQ@mail.gmail.com>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-13-john.ogness@linutronix.de>
 <CAD=FV=VFxKL=sOMdhyHrgy2JOtzKJdOe4euwZRRAK7P-rNVjuQ@mail.gmail.com>
 <CAD=FV=WF2S9wQ6uR+VKU4EfDTVd0JnKkuU3Wyfo6P8E_FouebQ@mail.gmail.com>
Date: Tue, 25 Oct 2022 13:34:12 +0206
Message-ID: <87czagf8hf.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-10-24, Doug Anderson <dianders@chromium.org> wrote:
 > It actually only holds console_list_lock() even at the end of the > series.
 Still, it seems weird that we're declaring the `data_race` on [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1onI6Z-0007lw-S5
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 12/38] tty: serial: kgdboc:
 use console_is_enabled()
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2022-10-24, Doug Anderson <dianders@chromium.org> wrote:
> It actually only holds console_list_lock() even at the end of the
> series. Still, it seems weird that we're declaring the `data_race` on
> CON_ENABLED but not CON_BOOT ?

You are correct that it is not a data race (because of the
console_list_lock being held.) Petr has suggested adding a separate
function for non-data-race callers. For v3 I will do this and use it
here, probably called console_is_enabled_locked().

Usually CON_ENABLED is the only flag that is interesting during normal
operation. The kgdboc case is an exception. I thought about if we should
have console_flags() and console_flags_locked() to be able to handle
general con->flags access. console_flags() would be marked with
data_race(), console_flags_locked() would use lockdep to ensure the
console_list_lock is held.

But I would also like to have the _is_enabled special variant because
how we check if a console is enabled will be different for the atomic
consoles. I would like to hide those details in the _is_enabled
implementation.

John Ogness


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
