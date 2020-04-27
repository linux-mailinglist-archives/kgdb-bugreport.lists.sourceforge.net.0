Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AB01BA4ED
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 15:41:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jT40Y-0006b9-Fw
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 13:41:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jT40X-0006as-45
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 13:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qskqBCfdzREjKA9fa2frF/rmcEBt4W75Oo1RINDuL60=; b=bLk7dW0WF9FAmpxdtdcgCUL6tG
 psJM2l32VkP01vUne7xem1b/WuN4sm6iJlrXuSWC/bwDuce+THfBRfPiEmZO08+l3bKtElAcs7fAJ
 z3j/cy9pDgOWL2mvPplLDWzsFDRRzl4zPbUgjXHG0sc5zCuAfzVKujf3clTKsKYqvYc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qskqBCfdzREjKA9fa2frF/rmcEBt4W75Oo1RINDuL60=; b=IKKR7EXBTK79pTdXIzEapOuKuU
 Nu7jL47kUDTdbq2rRNHMfEeyJ7I7PgSZDvrG/16QsQL/cumZm2pmBk5POoLUeApnwdfgkd4tO561R
 v98f8SBXz49k5I+knsl9t/wfQ39GfYNaDzk4wUqLFEoxhkjgGvnHc7ZSDax/8XMjkyXo=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jT40T-00HZWL-Kn
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 13:41:12 +0000
Received: by mail-wr1-f65.google.com with SMTP id x18so20587898wrq.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Apr 2020 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qskqBCfdzREjKA9fa2frF/rmcEBt4W75Oo1RINDuL60=;
 b=PciYzbFDVyI+JIUgP7z4s9KZGSe0p7vVs8ALpXX7D9YagVDMkP0ZpacdKqu66I6N/u
 hC5mNmb0O2xFCsNlb7xP1snYcqKl0rKblIFQ7SYdNaxwK8juEMldsh6AQOHPq9ozka+S
 5PuQZAkMb4QA61dJhgB+1fcjyw3ImIVCCYZE2jhOOVBo70juqnWxqPEDuJ1KHsILhuCx
 kOwyDktgGgvnwEoRrLT6nUugVCPR6c9sLIG7eiXuSfbR8JkhYKVgRtyaE8mUXpEzpsKt
 RfWosq4o2vWaAdyfQMbmJDAiTBko0YxymWfDbCbHxndy2oQcwNUOjClfoa0f9cm15KOp
 /x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qskqBCfdzREjKA9fa2frF/rmcEBt4W75Oo1RINDuL60=;
 b=g4WnkX1VlHvsAV/tmUUTl7HGh3RnnOZmk51uQWPt0jvINY9Q+SQPoy4KFOXaHEJWhh
 XXTBKBYufzsvUnTNiD6OSC67ar6SVwSRwHI+oGH9HIX6YS662k3KrGjRgXOK5BKB0Uoh
 LViRCzQrD1z8XlkHLa6DZ8tMq7gT1Id5PAeRe9szZDpPiCNAOGXDWnLwbE9YeM5ZyXq4
 GmbO+3u9PITyvIP3RsZqHmLfC+MmHiIhMukY9EmHdDS4ntShOd5PluQosg5HlJiwe3Ci
 a9aUYaRibCTACi8foglu32I4D+ZJx0wC4SQ/u40Z7jGTuYxqhrUwyNrj2UEVwb20QKTX
 FTTQ==
X-Gm-Message-State: AGi0PuYJDENpzqecIdbZsnEWBbCebps4Ygd26//tNn05nji/9H3jLMYC
 HDFWUFoMQMYipOZISXOVSqslCQ==
X-Google-Smtp-Source: APiQypI6s4BTjOqupT6wBSh+mk+0hEHoVYYO9xG3m/ikx3pp//H2vgP4TgZVdIglgNonn1iTVoGdYA==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr27292826wrv.314.1587994863218; 
 Mon, 27 Apr 2020 06:41:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d133sm17469376wmc.27.2020.04.27.06.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 06:41:02 -0700 (PDT)
Date: Mon, 27 Apr 2020 14:41:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200427134100.h7hrjn2wfokyfii7@holly.lan>
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.2.I02258eee1497e55bcbe8dc477de90369c7c7c2c5@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421141234.v2.2.I02258eee1497e55bcbe8dc477de90369c7c7c2c5@changeid>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jT40T-00HZWL-Kn
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/9] Revert "kgdboc: disable the
 console lock when in kgdb"
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

On Tue, Apr 21, 2020 at 02:14:40PM -0700, Douglas Anderson wrote:
> This reverts commit 81eaadcae81b4c1bf01649a3053d1f54e2d81cf1.
> 
> Commit 81eaadcae81b ("kgdboc: disable the console lock when in kgdb")
> is no longer needed now that we have the patch ("kgdb: Disable
> WARN_CONSOLE_UNLOCKED for all kgdb").  Revert it.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
