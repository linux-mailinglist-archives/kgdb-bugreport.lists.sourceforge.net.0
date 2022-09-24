Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C78975E8B69
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 24 Sep 2022 12:17:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oc2Db-0005rR-J6
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 24 Sep 2022 10:17:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <senozhatsky@chromium.org>) id 1oc2Da-0005qi-30
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 10:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3+pOaDQW9YjxLklfVNTeyrUxpQCI7rQ2FY27kMcvVNA=; b=l3Y7DAmhrTCR5Tj40wDC8NyGjy
 vVSHQ/N0Qwn41M/MChTTaXD7Q6hqub3q7VY2Bd4jrtkAdn/7Uuo1R4ZRqEC0Szcs14lRUABgsJWnP
 Lyg6zFMmcyG8hCco2TLeoXph/Q/e3BHWS3lHunvsCIT25ivz/u/Cqrqlr3cuhn9sU2bw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3+pOaDQW9YjxLklfVNTeyrUxpQCI7rQ2FY27kMcvVNA=; b=Sil9EMjoNyWjSpU8W1imDObNhQ
 IVYNUertbd2wM1qENRAr7jLDoAACXwmvHTZYsBx2QUGuM8RMUso7jaZlj/OHVYC8o5cyMtOjuAH/v
 VM2ObrlmTlOrAaLkVsodaHPOlwYLIMoQCZDnurou/ERkgHO1O2SbFK5eSdqyC0XiHFWM=;
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oc2DV-001AU3-Vb for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 10:17:05 +0000
Received: by mail-oi1-f169.google.com with SMTP id s125so2693407oie.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 24 Sep 2022 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=3+pOaDQW9YjxLklfVNTeyrUxpQCI7rQ2FY27kMcvVNA=;
 b=HB9MKYQSVCpN/uOYAgHtfTu8vX+gh120MEMg6y8EIcdyz09xYzp2JSduLy24Dvszy4
 1P6BsSMu2mOvfjkp7zHTUtONSi2wbDo6M1uy9AKuN43KZoUA4/EqJvSPJHoKE8piFuiq
 TFDPTQqsUqfRalbN7HFLyt9F8n9Jwf+Qj+abU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=3+pOaDQW9YjxLklfVNTeyrUxpQCI7rQ2FY27kMcvVNA=;
 b=OWjLoi/eErDtx0dLZtf5L/t0g317H39dNZk0l6H1k3d8rjy/aipFwBAm8LxLeybQPM
 I9rRYCmiNeHDNEhjeKAvsmM071vyqecoVbyBA3rC3CouNPMR1SgVTK2SvrB/8i5r/pK8
 k0eWADbX2iyk/GsKqyGs5ndQD/0wxLycYvhhm4QVrAbxNBD22POoy6gSTR9wzi61Q1lY
 7gyFeFSG5gV9o/0pv7Fbsw9L0yY5musLF8A6YQn1PHw1bhRQ33roxpulZ+yoxGQ7J7zl
 5arQPQyYAZV/8JFMZ+rloVptdc98ivFCp5RBlK5QlahIx1F7sJ/HdlXfj9gHLcYRILVp
 741w==
X-Gm-Message-State: ACrzQf0KKzztiKSDlbsd1HRQ2kKvd2k261fUMfceCb3Hwnops/ihYnDl
 i30N2zbQpNQIgGKMSG7HML7bwFn368MA6g==
X-Google-Smtp-Source: AMsMyM50G4MkB+jPSoG0HzIFo+yOu3RUvfrllcNX4ltgLcfVL+PMcHqel4EXpC55kA3rQFQuMU8DdQ==
X-Received: by 2002:a17:90a:fe0a:b0:203:467b:9e64 with SMTP id
 ck10-20020a17090afe0a00b00203467b9e64mr14759009pjb.146.1664012866953; 
 Sat, 24 Sep 2022 02:47:46 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:f4de:2419:efa3:8fed])
 by smtp.gmail.com with ESMTPSA id
 y23-20020aa78f37000000b0053e61633057sm7899715pfr.132.2022.09.24.02.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:47:46 -0700 (PDT)
Date: Sat, 24 Sep 2022 18:47:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Yy7SOp9wKWdDnbLM@google.com>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220924000454.3319186-1-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On (22/09/24 02:10), John Ogness wrote: > > Patches 6 - 12:
 Locking and list conversion > A quick question: I wonder why
 xenfb_make_preferred_console()
 isn't converted to list lock and for_each_registered_console()? 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.169 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.169 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oc2DV-001AU3-Vb
Subject: Re: [Kgdb-bugreport] [PATCH printk 00/18] preparation for
 threaded/atomic printing
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Sven Schnelle <svens@stackframe.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-serial@vger.kernel.org, Aaron Tomlin <atomlin@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, John David Anglin <dave.anglin@bell.net>,
 linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (22/09/24 02:10), John Ogness wrote:
> 
>    Patches  6 - 12:  Locking and list conversion
> 

A quick question: I wonder why xenfb_make_preferred_console() isn't
converted to list lock and for_each_registered_console()?


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
