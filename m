Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5B96225C2
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Nov 2022 09:48:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1osgkk-00053Z-WC
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 09 Nov 2022 08:48:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1osgkj-00053E-A5
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 08:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AQTh+h4wAo4t46Rl+wdOIR7scWoK1pkYjOSDztAOvMk=; b=QRwu2GPEZm31H5lJiNT4JwScVl
 JlGPV3fxaDbusATXhM7zlrOME1AxCmc0aXtPLuIMFee39CbeG7oPEOKg10GSFLIznE228bFcD7XDF
 QveuyqPpuHG/++eGc/eCqgw+RQzw/BRS3RRLjkaU/C+pfFuoLAd2yEiHO6Ykn+PW3CtA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AQTh+h4wAo4t46Rl+wdOIR7scWoK1pkYjOSDztAOvMk=; b=eJWc/p3HXSjL+E+41iJMnmma0x
 i1gxyEnJeNDTJAwp6Us40I4+Hqkvq9L61WUpnFR9N+YGhxy6/H0x1HeY854OJITxFchKOHcM5oeDT
 E4VjWFBEY0a1jWxNc5FDgFxzCGzwTuE+emeF16lr3UHZQrKtI4gTb0JMDhXWdCXZsNMU=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1osgke-0007hX-Ay for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 08:48:09 +0000
Received: by mail-wm1-f54.google.com with SMTP id t1so10309891wmi.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Nov 2022 00:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AQTh+h4wAo4t46Rl+wdOIR7scWoK1pkYjOSDztAOvMk=;
 b=Cpek1q7QSMGXU1gFGsylqWYf0SzpoFAOnziq+0yCk/hPO0U0Xq2kq0DUIJhaSedm3O
 Jol89RRWCiZVRDnFZ/3Odn+y0+oQULQZ4SZh/JYYpFmkt8YPDvvQRSPFMgWtOjxHI4rQ
 pn4K+rQ4VIE7wTJxowiODzKlxgs/+S6PdIRt9mNzyqSq9+lEK6aeyjYrK+16bpfykehg
 +Ag+15KKt5KlviWRBZQh1SC00aHih4RA1FJZ+4Ex0k0dFQsxtWGtjuCVZoLWpcsCv6yw
 4ViyYZVhGSKO/q+v/ZQ+tapEmWuBLH8xHWRfL64tgbCSDpxJeE6xqiCauPfGbW0T8A30
 sdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQTh+h4wAo4t46Rl+wdOIR7scWoK1pkYjOSDztAOvMk=;
 b=35eLeW/VfBWHS3+v5h/fxgjGc5kATUYVMKevTnGJz1crIlynbzVOFvnmr+fsHFr37P
 FVT/+pcsAG24h5ZIFtff3ihyN6Y7AaX3TEp/goh19OWMSRXp9CfhbFR12GRDAXpeMyQK
 WAWqJ6laG+ehLlsVZb8TqDDtYJHCeC0g//jkfTmj6rAmZjrH1mHhXnRXZQD+VFtlsm2M
 gb3RrlR+r0hZVUpynExovxzT84jOTYK4rbYpXmzUpoFJflt6PnT83XFWdXEuyG7cLJuV
 gfJpL79MHRqd8zuWrr2VnGjn2LbiaNgVT/JdraFBUG27ccnPn/vOyxiSJMqzxwHEpy5A
 Atnw==
X-Gm-Message-State: ACrzQf0+8AHPyUtCw5pky/j1ZnU2R1O9SEzB0U8pMRcbdM3+J+Zkr060
 yAvmmOHDquq/KaBo2fGe9ba9bwg4tC21Xw==
X-Google-Smtp-Source: AMsMyM7a3muG+xctXMNmA6t/4RK9t8xXwL/BnJxGkPaozlKTl4ulPc+VWNiTqriOd50k7tssbwBdJg==
X-Received: by 2002:a1c:7704:0:b0:3c4:bda1:7c57 with SMTP id
 t4-20020a1c7704000000b003c4bda17c57mr866812wmi.6.1667982057803; 
 Wed, 09 Nov 2022 00:20:57 -0800 (PST)
Received: from ash.lan ([167.98.0.196]) by smtp.gmail.com with ESMTPSA id
 n22-20020a1c7216000000b003a6125562e1sm699068wmc.46.2022.11.09.00.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 00:20:57 -0800 (PST)
Date: Wed, 9 Nov 2022 08:20:55 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20221109082055.melzih2jwhwjztam@ash.lan>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-3-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-3-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 07, 2022 at 03:22:00PM +0106, John Ogness wrote:
 > From: Thomas Gleixner <tglx@linutronix.de> > > Unprotected list walks are
 not necessarily safe. > > Signed-off-by: Thomas Gleixner <tglx@ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.54 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1osgke-0007hX-Ay
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 02/40] serial: kgdboc: Lock
 console list in probe function
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Nov 07, 2022 at 03:22:00PM +0106, John Ogness wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Unprotected list walks are not necessarily safe.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
