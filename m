Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E01221BA638
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 16:20:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jT4cE-0007IQ-O7
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 14:20:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jT4cD-0007I5-DC
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 14:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bee/vT9YZsF5aLuysXN53gVWnahANuP+/H4BtD8nDYA=; b=fQadh9L3PgZLCrj+jaV1zYG7CD
 J7F0jXIWczrwjwxuY+LPXHKqOaToQKQLZ9sL3n9nnVa94LH0Zt5hk2PR2Yv9Fa8hn0ND952vAIZke
 dGZBTkWurisGC0dYAQD9joeJFDIsjDr6Kfkg7h8vrvhofCmAUqHPEpX3zOwqn3ewLSXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bee/vT9YZsF5aLuysXN53gVWnahANuP+/H4BtD8nDYA=; b=SNHX+9jkkuEWjjybd7OFaOsPz5
 OV84pnB3Nn87XWVyRDIddOK14j+SqzpiFbBu7KWzUz90EuBKJN0hJNNaEA3kifc1yS+8wPNZoSUZU
 W1TJDYqyo+h3IfQMM26IM1z42RXcRvNp0IVTaItR4eBJP93Mt1EOfvDmKihbcL+9PWY4=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jT4c7-00GWBz-Sd
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 14:20:09 +0000
Received: by mail-wm1-f65.google.com with SMTP id h4so6474140wmb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Apr 2020 07:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bee/vT9YZsF5aLuysXN53gVWnahANuP+/H4BtD8nDYA=;
 b=Fv6KdKme0P7Hd6Cv7sn90bDFGKT3FWV4huW02i2XsZ69hzzo1H3u17OS98OzaZnBTB
 278KEthOnv0lxhcPsLu7SX/vgTtq4wPqX+E2pWCx23VhbpaUXDQfoVYsJbx/Kuva3O2S
 PJxvYmNcCpSHd+6bDJnvLSiezLzVKMsooJagwhfuXLnIQQEXEEX67MWfkbn6V0X/Zu98
 UsMjjj0yyJiwg66FMZp3hMqn6vGHm7TvUasx+awqJcZjlvQewIC2DbBCYNbvd62AZtYa
 0AfvcSlUzA3xn+ukScz45mTXRED9CfUSUT8dzrtuQMu+s7czphHXriJF2Q1TTHqpC6ZW
 LZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bee/vT9YZsF5aLuysXN53gVWnahANuP+/H4BtD8nDYA=;
 b=GNa0ruKZEk1SA1B7ztva4tK8kAZY/XEyJTid2cvQ5IWrYjpQcHftnFghCsDVimPFy9
 bsNf5UA+kJ/vULAzyHxf8nitZvchtmuLKZFJZ/wotV7gx1f8skN0PqXP6CDL7nz6MNT5
 XPzRNu9YI36KSPimdToxwrMOPebWi4KjYivjzlFEcqzebClqk4UnD3ep8efotVKUGQnO
 iAHFreTLS/1jcimPitUhfF2gIGo2BmocTXL/Q7t6MLTu64sel6WIdv4G4xL7rrWr+YRi
 5Mv99aVEFZc+iV+SACchP7L8flzBpvZQmQjCpew0dLYRUmlouL5RHwlkmtpQZaw3z8/M
 26Tg==
X-Gm-Message-State: AGi0PuaJrjv2HMyit0NiN/Dv/NOzsmRgTni73Et/uavp1GuhYsfggcPS
 Nfazp9ua6c8PBHVg9PrB4Gq2Kw==
X-Google-Smtp-Source: APiQypL3l+lAat7PP7CR3gM2nPKe8kVnYD5lj6efi+kyjeJHTF/ddP0kz0TZeQ47rwxSl4/e9jMwqQ==
X-Received: by 2002:a1c:9cc6:: with SMTP id f189mr25872640wme.75.1587997197302; 
 Mon, 27 Apr 2020 07:19:57 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i129sm16621988wmi.20.2020.04.27.07.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 07:19:56 -0700 (PDT)
Date: Mon, 27 Apr 2020 15:19:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200427141954.d55djgbq74e4dme5@holly.lan>
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.3.I4a493cfb0f9f740ce8fd2ab58e62dc92d18fed30@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421141234.v2.3.I4a493cfb0f9f740ce8fd2ab58e62dc92d18fed30@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jT4c7-00GWBz-Sd
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/9] kgdboc: Use a platform device
 to handle tty drivers showing up late
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com, agross@kernel.org,
 bjorn.andersson@linaro.org, jason.wessel@windriver.com, mingo@redhat.com,
 bp@alien8.de, linux-serial@vger.kernel.org, gregkh@linuxfoundation.org,
 jslaby@suse.com, tglx@linutronix.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 21, 2020 at 02:14:41PM -0700, Douglas Anderson wrote:
> If you build CONFIG_KGDB_SERIAL_CONSOLE into the kernel then you
> should be able to have KGDB init itself at bootup by specifying the
> "kgdboc=..." kernel command line parameter.  This has worked OK for me
> for many years, but on a new device I switched to it stopped working.
> 
> The problem is that on this new device the serial driver gets its
> probe deferred.  Now when kgdb initializes it can't find the tty
> driver and when it gives up it never tries again.
> 
> We could try to find ways to move up the initialization of the serial
> driver and such a thing might be worthwhile, but it's nice to be
> robust against serial drivers that load late.  We could move kgdb to
> init itself later but that penalizes our ability to debug early boot
> code on systems where the driver inits early.  We could roll our own
> system of detecting when new tty drivers get loaded and then use that
> to figure out when kgdb can init, but that's ugly.
> 
> Instead, let's jump on the -EPROBE_DEFER bandwagon.  We'll create a
> singleton instance of a "kgdboc" platform device.  If we can't find
> our tty device when the singleton "kgdboc" probes we'll return
> -EPROBE_DEFER which means that the system will call us back later to
> try again when the tty device might be there.
> 
> We won't fully transition all of the kgdboc to a platform device
> because early kgdb initialization (via the "ekgdboc" kernel command
> line parameter) still runs before the platform device has been
> created.  The kgdb platform device is merely used as a convenient way
> to hook into the system's normal probe deferral mechanisms.
> 
> As part of this, we'll ever-so-slightly change how the "kgdboc=..."
> kernel command line parameter works.  Previously if you booted up and
> kgdb couldn't find the tty driver then later reading
> '/sys/module/kgdboc/parameters/kgdboc' would return a blank string.
> Now kgdb will keep track of the string that came as part of the
> command line and give it back to you.  It's expected that this should
> be an OK change.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
