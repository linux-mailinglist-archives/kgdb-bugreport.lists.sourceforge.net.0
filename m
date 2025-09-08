Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 648FFB4935B
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Sep 2025 17:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+npRWXDlzw+HSop6MC9kAtFtCeXgD6wkjlpc6JOwtWc=; b=Tj2+25MZ3kn1jaEUf3SIFUcDB4
	aCplNwzvGPX5wFi1Qob5XUv23/2SdzNJi4TW2fHYdK3hoQQZ5uCghaM2q5mBI9UdXbyZMicoNKLmy
	vi1wa7ExLKzz8GfkFmVkP2r1Xb7+s3ge5hOSk14hkGIRYCsUM63NeUrj4km0pFITGkKY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvdoL-0000Sv-9M
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 08 Sep 2025 15:29:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uvdoJ-0000Sn-8N
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Sep 2025 15:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C7e3NHcRtUdMeGJ27w4CDbN47GbaVmfZ31ggRbiSxLI=; b=mNN8NL5z0xasEOZKX8Tu5DvOaM
 vN2mwI8rPMEDoRcwN6QKSCn2+LI8O1KtsGBz0loHg7dUdTo4xodYF+dMjIvoiPyt5ePqyp8hTMayt
 FJpnb/Bi+fRJnDwUZfwF8+0NJId/17lgCVNRSOBwRDA303T26TNV1USp/9Ut7iwXho94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C7e3NHcRtUdMeGJ27w4CDbN47GbaVmfZ31ggRbiSxLI=; b=JeRaxVSPwPN6OnoOj7q40ned4H
 KD1G99yQ7sVePuzbNEFkBbrOKHuoUOkkG3w0GwIq3kVj8CaF2scitagrhq5UnVMCmork/eUyQsHvC
 UgaQXeA3XZvTKNzZJg/a8AOXgmZ/EDToVRw2zzxah4at/833yu+OlwSRD0Wgy9n+IzLI=;
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uvdoI-0006xk-Se for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Sep 2025 15:29:39 +0000
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b0431c12df3so788553666b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Sep 2025 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1757345367; x=1757950167; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C7e3NHcRtUdMeGJ27w4CDbN47GbaVmfZ31ggRbiSxLI=;
 b=OiAQnuTgAefJzmK4Oi7etcMySi2cibVKhURyfiBFYZ+41+6AcEUHcedOC5vIUvNS9X
 uy9tL9JDK77AuFZaVkyERQr7ywnJdzRFD7kcCDDzyg1xHvarY7wNber3Em6TlXgb1PDa
 3oynqwS7BmlO4FckkJcmyC5BDQVDkjqS+x2x1ujLjm8UomJ0xxkOpI2hf2ebGoj3lz+n
 t+JW6uk86vvtjtOXqSwoJ91rAbNTzFE4D8IcX75IOIAnM382KoeLwY13RW9/zQJZm/gI
 r7YblgBkK4kzxNbgPGsY1kcZ8I+hw6SbUkoggtLX8mu+fWTS+d67C+NYkQCKojIyI4iA
 tRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757345367; x=1757950167;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C7e3NHcRtUdMeGJ27w4CDbN47GbaVmfZ31ggRbiSxLI=;
 b=jZc6QRIv/8Ap3VOdamaldR2SqLY+Pc0BVXBR+HHqTmR7qk09pH0bKnozOogNZlK7Do
 XiP/c5Lka79qjTmzAlWwK22BstG+S6O1DOlm8JeKBoqC9XrXbz9458XGATJRIDn4Yar8
 jJjIDA0VTaYbk+NYxXdw0Es9RKUMTjT44DYmP796Hy2YcO4ukA4MTD1F88WdB7gYj74W
 /ZdGlsnA0z2lcnCF0vm4pDkjqYNDFm507iagHA7Dc0lrGgEnaVnfQzDptes9KaXWCTcP
 Z4BYrmMhUhBwJIyX01wZiFjAsKZRLfm8HGjzAplF0iLup5ZWVz8ZLpkuKQLgx5KpZVWL
 BIhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYNNeHj4V+DvTb7nCK98ws7tVpxm1cwlLN86kXKkbocexfA92Q6wfAgPXkxsisdsDSClDFr171DFBSwR9lXQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzS41DBd+8e6+cIseb68oTuGpTQv92+pJLoZttEnnSxuqXViIav
 Zb3EBQs4zgUrEOA/KdLfpAzwxwJcAL6bBhx20RSIilnk2l12gI+JzA2C1/N8O8xjSpj6e7cyy05
 5OB+mqB4=
X-Gm-Gg: ASbGncvfJKLMr59V6U6uUpkr4G0r3zHjCriawfXBZc3Qz2cqiKiV6TK1wq7lV1iP3QC
 slsBabaWFJ53JokvwFrpKOaPwqRNpxkQndZzAj4gKB4/g+9hlHCJK4ACU6vWdMS3HXwg5/aFVW8
 c7VjrXzKOyIwE5rzFSNqgaUS1p098eo91G1jXCb4jWu8rvBihZOxx2gFvS0qlhB4gNG0B+4Kfvy
 Uocw33L+RjAOL53fEF7XuqmKu7LQ4MkpE7BXT02al9Ftc5bpLCLNdQhvymcK96Ul3AM1MU7pFyZ
 laL2PDo8z2N/83D5Wj6lYkqr7dZ3EmR0pja+PKZdx4mTlv6H1tPi5aIYNDMzzdkDEbYPLzVB+Bn
 LmDKZPq43UMAsmqRgU3F2r+Fa+G8DNtaXlkQs
X-Google-Smtp-Source: AGHT+IG0+BqTueSpNbnuBlandiDGEja6A/cZ02YwvG41q3EwLk+9b/IGnNBQqbfzTmMyGVG/StOaRg==
X-Received: by 2002:a17:907:983:b0:b04:8420:b6ef with SMTP id
 a640c23a62f3a-b04b16d713bmr837603166b.61.1757344987584; 
 Mon, 08 Sep 2025 08:23:07 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b041d7107d9sm2097741066b.4.2025.09.08.08.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 08:23:07 -0700 (PDT)
Date: Mon, 8 Sep 2025 17:23:05 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aL702dMFPy2bvfkp@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-3-cd30a8106f1c@suse.com>
 <84y0qtdk99.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84y0qtdk99.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-09-05 16:58:34,
 John Ogness wrote: > On 2025-09-02, 
 Marcos Paulo de Souza <mpdesouza@suse.com> wrote: > > diff --git
 a/kernel/printk/nbcon.c
 b/kernel/printk/nbcon.c > > index ff218e95a505f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uvdoI-0006xk-Se
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] printk: nbcon: Allow KDB to
 acquire the NBCON context
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-09-05 16:58:34, John Ogness wrote:
> On 2025-09-02, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index ff218e95a505fd10521c2c4dfb00ad5ec5773953..352235a0eb4a484caccf86d3a57d1a149218ecec 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -255,6 +258,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
> >  		 * interrupted by the panic CPU while printing.
> >  		 */
> >  		if (other_cpu_in_panic() &&
> > +		    READ_ONCE(kdb_printf_cpu) != raw_smp_processor_id() &&
> 
> This needs some sort of ifdef CONFIG_KGDB_KDB wrapped around it. Maybe
> it would be cleaner to have some macro.

Great catch!

> #ifdef CONFIG_KGDB_KDB
> #define KGDB_IS_ACTIVE() (READ_ONCE(kdb_printf_cpu) == raw_smp_processor_id())
> #else
> #define KGDB_IS_ACTIVE() false
> #endif

I like this. It would fit into include/linux/kdb.h which already
contains the #ifdef CONFIG_KGDB_KDB / #else / #endif sections.

> and then something like:
> 
> 	if (other_cpu_in_panic() &&
> 	    !KGDB_IS_ACTIVE() &&
> 	    (!is_reacquire || cur->unsafe_takeover)) {
> 		return -EPERM;
> 	}
> 
> Or however you prefer. We need to compile for !CONFIG_KGDB_KDB.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
