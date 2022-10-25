Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA02860BFAB
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 02:34:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1on7u6-0006Wx-Fb
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Oct 2022 00:34:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1on7tv-0006Wm-RH
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=23CZ4vA4i98W1nbCbv2ZjLLFBQ1q7plrKRviYMc9dQY=; b=T3MaLiRrFRNKc8HSUU2dd9Od75
 /lJcriJw64ySmgUdHP/Eh9sJ7IiYzibyJuUNMiSHxIOIHPj5ZVJNyDj13reK702NKhTU5iJXZL4l1
 nhrLwvKp/V1fYaQRnWMowFq9g2EDwasn6kI7SwuMK3qXVwF0Fq6iq3v2vim1xAFBlASw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=23CZ4vA4i98W1nbCbv2ZjLLFBQ1q7plrKRviYMc9dQY=; b=eUUPm64prWLaZCYy0dBLY5039M
 uRhecVQqTzFi1/SHoMd2BzWdmSdX6PEvaQUkT3YRgi/jIiL0ipIlxi/Y5YWkoBXoXup9ZVbylpAkh
 r5QT+cxTZneRpszH7DzE5JLhJTIe01Q0xoWhS+huvTVlVfGqnHdTYuteb6oSXcGZl+p0=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on7tr-00GDvo-OI for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:34:39 +0000
Received: by mail-ej1-f51.google.com with SMTP id k2so8848630ejr.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=23CZ4vA4i98W1nbCbv2ZjLLFBQ1q7plrKRviYMc9dQY=;
 b=gUtM1bX+9AmKX0fN+I2coUZ/gBg5Zmg+i1ZO44YmZLIMFCKsYf5MbCnmv3nYoYBM9T
 Nk+Opwq8i7lXrs6x+2lkbcakPKleOk5ygjBcjiKOAVSA/LVrtj3bPz1Zn+gWXsKa3mV7
 7V0idwlnPxnsM3bKEtlZeAwhPMHKlf5jv1bM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23CZ4vA4i98W1nbCbv2ZjLLFBQ1q7plrKRviYMc9dQY=;
 b=Q1xFMtW9L679JA8Y0qUOYHZdFi8Xboge9bubVvUqcB3eSSMwArxaZL1b7ck6efVif2
 0iJ86vHzDDo/Qjfe3Ej5UJzGIhIeaFMKbPwEe6B/l/V/WsRQYjV2BHW4B1NN3Vjzbv7n
 n7eJ9NBbxAaYMBYSogSlRA5VAku49fW/Sjcpj7vubu43j7unWbMULDPDtzLUHty+5Vy0
 Eb8q/Y08NZXfa97vrzO8x26hs7PTI3RuIMkZMIcON8fF+cz969ag7GTeMmY2ZNZwjadR
 Wx0F8gF07OWY5menCdlX6oOapWCbXZQRh592GDE8IXhDIJoJJ4+niOdwjCPLqk7bVTTu
 dqmg==
X-Gm-Message-State: ACrzQf3oF0WP+zLQG5XCBnko/h/J8PKpe5xVlBpad/zZjrV2SGRvW4Ut
 xtVfqeFH6QvgrVIha3jZSHjoLN3lY6q32Aax
X-Google-Smtp-Source: AMsMyM4vMpIMOUypdSJqUy4e+W7lYPUixy5hMES3zAbufr6rFtffoApW1Qd7rRd/NmY1AlQPpzBQqA==
X-Received: by 2002:a17:907:6d08:b0:78e:e87:5c06 with SMTP id
 sa8-20020a1709076d0800b0078e0e875c06mr29146099ejc.511.1666658068743; 
 Mon, 24 Oct 2022 17:34:28 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 et19-20020a170907295300b0073d71792c8dsm529248ejc.180.2022.10.24.17.34.27
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 17:34:27 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id h9so7389732wrt.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:34:27 -0700 (PDT)
X-Received: by 2002:a05:6000:3c1:b0:236:5779:546d with SMTP id
 b1-20020a05600003c100b002365779546dmr12326195wrg.405.1666658067197; Mon, 24
 Oct 2022 17:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-2-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-2-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Oct 2022 17:34:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQ8WFoZUm=P+kKo2oGAfSGOmadvhDkE4PQe6_-33zi_w@mail.gmail.com>
Message-ID: <CAD=FV=XQ8WFoZUm=P+kKo2oGAfSGOmadvhDkE4PQe6_-33zi_w@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Oct 19,
 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > From: Thomas Gleixner <tglx@linutronix.de> > > Unprotected list
 walks are not necessarily safe. > > Signed-off-by: Th [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on7tr-00GDvo-OI
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 01/38] serial: kgdboc: Lock
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

Hi,

On Wed, Oct 19, 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Unprotected list walks are not necessarily safe.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> ---
>  drivers/tty/serial/kgdboc.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
