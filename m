Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C1AE7ACA
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 25 Jun 2025 10:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNkHhND7wTA9e5f5tRH1w2TBemcXONIXZSx9RPntd+0=; b=HDpUL18ZpZWWy1068mq97riW3N
	NvCvNZgtdxL7oJGWe9Oi0/3yZVu7AoVxRSRBGfGFFOMqD1eV/rqe8r395SPb/zf7xlYMboPynG++j
	oebKkorZkv0X8vAMxodKdjipwNQf3ANOnvHptuGllAuBWrN4k+e3suUOamP04rn70KZc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uULpN-0007fW-PD
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 25 Jun 2025 08:49:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uULoc-0007Q7-He
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 25 Jun 2025 08:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gzuTLj0h0BP8Faa4F4QGiLAR1aawV6atkUr8dq493UA=; b=JlYQSFOUSlaGEmgaXqAisVq1DH
 1Pq3j1kb0eoehAc/CQ/UF7nTOWRbY1wNi+/US4A6iIz+z+G/0DP3jmMwSZgk+46Dx0yiyrFlW3scd
 ZJUrN3R2vrlN4OObMdRXrZtkykQNMGLImT4u9XUHZkJHzOjxlfpQACp5VrMJ1UbhVOZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gzuTLj0h0BP8Faa4F4QGiLAR1aawV6atkUr8dq493UA=; b=c98zcB2rIlN6sFQ/3/GAYXvUyo
 +wIWUqMjww97SluHIHdgKwaWTTEhrJWuz28OhK+yiHnVnZFfq+X7UKJdGqlhj05YbzpOEt8awGJiB
 AFD9Qa6JOOM/51wk3WNUfZo931S5bF7VtUOdsO81+dW06Tn1WoWe1wk8AR3Vs+Mg/uoM=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uULob-0003RL-CA for kgdb-bugreport@lists.sourceforge.net;
 Wed, 25 Jun 2025 08:49:10 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso5258321f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 25 Jun 2025 01:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1750841343; x=1751446143; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gzuTLj0h0BP8Faa4F4QGiLAR1aawV6atkUr8dq493UA=;
 b=A2IUEpa59a/itMJIJZ+SDYdzpYG4l1uig3z7nUwVFiJFlCaXiMPwpEI2yOZp0xJyWk
 5vuwnBfWNCsyavzAh7tzDM0EhiM2ThirestLqEI9ly0GA7azOnd/kjbAzd8lM9+s1k3k
 f6N0Bjzuj9PWXBk9567bPvBOV3yAca5FCc7/H4rjvOd8+/yWDaY9ATDllrwitTsr1Bo6
 JyHJa2aPnzFGW5rdK8p/fzvwwbsd1FFawzc++EoYqol13YMSAhW9vjA2tuDzbzVt22Z/
 ipw4ko10P1FyQBvjLi3bKZOsEfnBO4CjOi2yH1y21Th9k8k7lfAkpBgarDyiPCP9HAd+
 JgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750841343; x=1751446143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzuTLj0h0BP8Faa4F4QGiLAR1aawV6atkUr8dq493UA=;
 b=U/TmFvwTKRUFEQFHcNobM5kCk9hHZVCHkpTNt7wdqNgzipY+X9czK3pP3TxGG1o0JG
 FL7d5OzACLvGcRxD9a8trBNh0LoBFinIxSlgxP2BAF3Ekloev3Al5ufEzkSWBiYppjxt
 MAORY5XdGJaMo2BYvM2JX0czrSVQm0VCZVv1sVkEyfq531TOKZ5QXnElCa1zZIarJk1B
 XlGBoPODwjozUQpArh4ExfRgfECm57suZyA3UX3E4bJcilwkYm54nAOCmpvI6aUOGOwP
 Wd6IuTXR4ppRxhNhpBWphnt+27cbIdIGysLr9mKSwVGv1U9EDM8CkwVkmoI5wDpcpAAQ
 oozA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVUQKKiK/9nJOBq59Rg5rqxq4ok7hVE5cv7/wF/xNTD3yjnBE7ic4eOKzGbvyx5b7hQCgCNMjpZyb9GLsHgg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxpY9vlnnXfV4KUvsQsLnV3RJ6qLy3y2wRynMK2j37esUDhVFFA
 YOQGjGlHhcYHNOBsNxbazxQBY1ZNgG83q8aWjCIS99eaQ+6Th1JHbI6TR6DumM1lGGw=
X-Gm-Gg: ASbGnctOT5C44CZtHjPDczbMix4Tb33F3Yl6U6p1nmaPuDbaOAAnGCfwsUexIVu/Clo
 RuEjBfIw1CMLPDrwccoGzYyCAwQsqRpCItVvhLMZJoSD2wCO0Equxn2nOUp4v2d/FsCgIE9yJSr
 Q2LxKVpAcSEa45VBqWTmIm0Ux7EKvIsse2jXmOgV2LzPj+9K65AWK/gt9Hux2Ux8N7/82k2KvgL
 zJMo2/dgBqXOY/DTIU/d16Qh2beBSsAaynvY/NMCQ+gPu/MPURGvaAbYlobTBFnpbFLuiOi3YOf
 8RfwTLxqbdHWYUHrG/TDeB6nEuggJCtSsihWGzzgAQjiN7QBDEv96cm8LwlWD6ba
X-Google-Smtp-Source: AGHT+IF1swuTytOZ/mOzx/aDJsTp0hYVrC347nQzODYODKZFAGNs/udBAXxCCv2VIRKBSD921Bw3yg==
X-Received: by 2002:a05:6000:4803:b0:3a6:d191:a835 with SMTP id
 ffacd0b85a97d-3a6ed646453mr1182080f8f.41.1750841342692; 
 Wed, 25 Jun 2025 01:49:02 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83ea243sm132652565ad.72.2025.06.25.01.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 01:49:02 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:48:45 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aFu37RyHZ4wYF-ZV@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-2-f427c743dda0@suse.com>
 <aExBo-8cVOy6GegR@pathway.suse.cz>
 <84y0tmiidg.fsf@jogness.linutronix.de>
 <aFpkQHwNCslbKSP6@pathway.suse.cz>
 <84wm919z9i.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84wm919z9i.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2025-06-24 13:10:25,
 John Ogness wrote: > On 2025-06-24, 
 Petr Mladek <pmladek@suse.com> wrote: > >> > Variant C: > >> > ==========
 > >> > > >> > Remove even @flags parameter from console_is_usa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.52 listed in wl.mailspike.net]
X-Headers-End: 1uULob-0003RL-CA
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] printk: Use consoles_suspended
 flag when suspending/resuming all consoles
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2025-06-24 13:10:25, John Ogness wrote:
> On 2025-06-24, Petr Mladek <pmladek@suse.com> wrote:
> >> > Variant C:
> >> > ==========
> >> >
> >> > Remove even @flags parameter from console_is_usable() and read both
> >> > values there directly.
> >> >
> >> > Many callers read @flags only because they call console_is_usable().
> >> > The change would simplify the code.
> >> >
> >> > But there are few exceptions:
> >> >
> >> >    2. Another exception is __pr_flush() where console_is_usable() is
> >> >       called twice with @use_atomic set "true" and "false".
> >> >
> >> >       We would want to read "con->flags" only once here. A solution
> >> >       would be to add a parameter to check both con->write_atomic
> >> >       and con->write_thread in a single call.
> >> 
> >> Or it could become a bitmask of printing types to check:
> >> 
> >> #define ATOMIC_PRINTING 0x1
> >> #define NONATOMIC_PRINTING 0x2
> >> 
> >> and then __pr_flush() looks like:
> >> 
> >> if (!console_is_usable(c, flags, ATOMIC_PRINTING|NONATOMIC_PRINTING)
> >
> > I like this. It will help even in all other cases when one mode is needed.
> > I mean that, for example:
> >
> >    console_is_usable(c, flags, ATOMIC_PRINTING)
> >
> > is more self-explaining than
> >
> >    console_is_usable(c, flags, true)
> 
> After I wrote that suggestion, I decided that the naming is not
> good. There is always confusion about what "atomic printing" means. For
> that reason the parameter was changed to "use_atomic". Basically we are
> specifying which callback to use and not the purpose. It is a bit tricky
> because legacy consoles do not have an atomic callback, i.e. the
> parameter only has meaning for nbcon consoles.
> 
> Perhaps these macros would be more suitable:
> 
> #define NBCON_USE_ATOMIC 0x1
> #define NBCON_USE_THREAD 0x2

I personally prefer this variant.

> or
> 
> #define NBCON_USE_WRITE_ATOMIC 0x1
> #define NBCON_USE_WRITE_THREAD 0x2

This one sounds more precise but it very long.

> or
> 
> #define NBCON_ATOMIC_CB 0x1
> #define NBCON_THREAD_CB 0x2
> 
> or
> 
> #define NBCON_ATOMIC_FUNC 0x1
> #define NBCON_THREAD_FUNC 0x2
> 
> Hopefully that gives Petr enough ideas that he can come up with good
> naming. ;-)

I thought about better names yesterday but I somehow did not have
inspiration ;-) Thanks for coming with the variants.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
